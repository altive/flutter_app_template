import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/icon_buttons_on_cell.dart';
import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/url_image.dart';
import '../../core/stock/stock_entity.dart';
import '../../models/firestore/favorite_item/favorite_item.dart';
import '../../util/favorite_controller.dart';
import '../../util/share/share_service.dart';
import '../../util/web_launcher.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';
import 'search_result_controller.dart';

/// 検索結果の1商品情報を表示する
class SearchResultItemCard extends HookConsumerWidget {
  const SearchResultItemCard({
    required this.searchItem,
    required this.stockList,
  });

  final PaapiSearchItem searchItem;
  final List<StockEntity?> stockList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Amazon検索結果アイテムに一致するDB登録済みのアイテムをASINで判別（なければnull）
    final stockedItems =
        stockList.where((stock) => stock!.asin == searchItem.asin).toList();

    var counts = 0;
    if (stockedItems.isNotEmpty) {
      counts = stockedItems
          .map((e) => e!.numberOfItems.toInt())
          .reduce((value, element) => value + element);
    }
    // 商品カテゴリ
    final category =
        searchItem.itemInfo!.classifications?.itemBinding?.displayValue ?? 'なし';
    // 商品名
    final name = searchItem.itemInfo!.title!.displayValue!;

    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        ref
            .read(searchResultControllerProvider.notifier)
            .presentStockEditorPage(ref, searchItem, context);
      },
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: <Widget>[
              // アイテム画像
              UrlImage(
                searchItem.images?.primary?.medium?.url,
                width: 72,
                height: 72,
              ),
              // 画像以外
              Expanded(
                child: Column(
                  children: [
                    DefaultTextStyle.merge(
                      style: theme.textTheme.bodyText1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              category,
                              style: theme.textTheme.caption,
                            ),
                            if (stockedItems.isNotEmpty)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '$counts個ストック済み',
                                  style: theme.textTheme.caption!.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // アイコングループ
                    _IconButtons(item: searchItem),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 商品ごとに表示する複数のアクションボタン
class _IconButtons extends HookConsumerWidget {
  const _IconButtons({
    required this.item,
  });

  final PaapiSearchItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // お気に入りリストを取得
    return ref.watch(favoriteItemProvider).when(
          loading: () => const LoadingIndicator(),
          error: (error, stack) => ErrorWidget(error),
          data: (favoriteItems) {
            final isFavorited = favoriteItems.firstWhereOrNull(
                  (doc) => doc.entity!.asin == item.asin,
                ) !=
                null;
            return IconButtonsOnCell(
              isFavorited: isFavorited,
              onPressedAddButton: () => _didTapCreateButton(
                ref: ref,
                context: context,
                item: item,
              ),
              onPressedFavoriteButton: () => _didTapFavoriteButton(
                ref: ref,
                context: context,
                item: item,
                favoritesCount: favoriteItems.length,
                isFavorited: isFavorited,
              ),
              onPressedAmazonButton: () => _didTapAmazonButton(
                url: item.detailPageUrl,
              ),
              onPressedShareButton: () => _didTapShareButton(
                context: context,
                item: item,
              ),
            );
          },
        );
  }

  /// ストックアイテムを作成するボタンが押された
  Future<void> _didTapCreateButton({
    required WidgetRef ref,
    required BuildContext context,
    required PaapiSearchItem item,
  }) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    final scaffold = ScaffoldMessenger.of(context);
    // Providerにドキュメントをセット
    ref.read(stockEditorParameterProvider.state).state =
        StockEditorParameter.createrWithAmazon(
      stock: StockEntity.fromSearchedAmazonItem(item),
    );
    // 詳細画面へ遷移
    final result = await Navigator.of(context).pushNamed(
      StockEditorPage.routeName,
    );
    // 何か返ってきた時のみスナックバーを表示する
    if (result == null) {
      scaffold.removeCurrentSnackBar();
      return;
    }
    scaffold
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  /// お気に入りボタンが押された
  Future<void> _didTapFavoriteButton({
    required WidgetRef ref,
    required BuildContext context,
    required PaapiSearchItem item,
    required int favoritesCount,
    required bool isFavorited,
  }) async {
    var snackText = '';
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    if (isFavorited) {
      // お気に入り解除
      await ref.read(favoriteProvider).removeFavorite(item.asin);
      snackText = 'お気に入りを解除しました';
    } else {
      // お気に入り追加
      final favoriteItem = FavoriteItem.fromTPaapiItem(item);
      snackText = await ref.read(favoriteProvider).addFavorite(
            favoriteItem,
            count: favoritesCount,
          );
    }
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(snackText),
        ),
      );
  }

  /// Amazonボタンが押された
  Future<void> _didTapAmazonButton({required String? url}) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    // URLを開く
    await launchUrl(url);
  }

  /// シェアボタンが押された
  Future<void> _didTapShareButton({
    required BuildContext context,
    required PaapiSearchItem item,
  }) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    shareWithPaapi(
      item,
      size: MediaQuery.of(context).size,
    );
  }
}
