import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/icon_buttons_on_cell.dart';
import '../../../common_widgets/loading_indicator.dart';
import '../../../common_widgets/url_image.dart';
import '../../../core/stock/stock_entity.dart';
import '../../../models/firestore/favorite_item/favorite_item.dart';
import '../../../util/favorite_controller.dart';
import '../../../util/share/share_service.dart';
import '../../../util/web_launcher.dart';
import '../../stock_editor/stock_editor_controller.dart';
import '../../stock_editor/stock_editor_page.dart';
import '../../stock_editor/stock_editor_parameter.dart';

class RecommendDetailCell extends HookConsumerWidget {
  const RecommendDetailCell({
    required this.count,
    required this.item,
  });

  final int count;
  final PaapiSearchItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final hasItem = count > 0;
    // お気に入りリスト
    final favoritesAsyncValue = ref.watch(favoriteItemProvider);
    return favoritesAsyncValue.when(
      loading: () => const LoadingIndicator(),
      error: (error, stack) => ErrorWidget(error),
      data: (favoriteItems) {
        final isFavorited = favoriteItems.firstWhereOrNull(
              (doc) => doc.entity!.asin == item!.asin,
            ) !=
            null;
        return Stack(
          children: [
            Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  children: [
                    UrlImage(
                      item!.smallImageUrl,
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
                    // 画像以外（アイテム名など）
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // アイテム名
                          Text(
                            item!.displayTitle!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (hasItem)
                            Text(
                              '$count個ストック済み',
                              textAlign: TextAlign.end,
                              style: theme.textTheme.caption!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          // アイコンボタン
                          IconButtonsOnCell(
                            isFavorited: isFavorited,
                            onPressedAddButton: () => _didTapCreateButton(
                              ref: ref,
                              context: context,
                              item: item!,
                            ),
                            onPressedFavoriteButton: () =>
                                _didTapFavoritesButton(
                              ref: ref,
                              context: context,
                              item: item,
                              favoritesCount: favoriteItems.length,
                              isFavorited: isFavorited,
                            ),
                            onPressedAmazonButton: () => _didTapAmazonButton(
                              url: item!.detailPageUrl,
                            ),
                            onPressedShareButton: () => _didTapShareButton(
                              context: context,
                              item: item!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (hasItem) const Icon(Icons.check_circle),
          ],
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
  Future<void> _didTapFavoritesButton({
    required WidgetRef ref,
    required BuildContext context,
    required PaapiSearchItem? item,
    required int favoritesCount,
    required bool isFavorited,
  }) async {
    var snackText = '';
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    if (isFavorited) {
      // お気に入り解除
      snackText = await ref.read(favoriteProvider).removeFavorite(item!.asin);
    } else {
      // お気に入り追加
      final favoriteItem = FavoriteItem.fromTPaapiItem(item!);
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
