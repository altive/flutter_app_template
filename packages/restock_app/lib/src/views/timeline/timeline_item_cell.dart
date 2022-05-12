import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/icon_buttons_on_cell.dart';
import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/url_image.dart';
import '../../core/stock/stock_entity.dart';
import '../../everyones_stock/everyones_stock_model.dart';
import '../../models/firestore/favorite_item/favorite_item.dart';
import '../../util/favorite_controller.dart';
import '../../util/share/share_service.dart';
import '../../util/web_launcher.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';

/// リストで表示するカード。一つのアイテム情報を表示する
class TimelineItemCell extends HookConsumerWidget {
  const TimelineItemCell({
    required this.item,
  });

  final EveryonesStockModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // お気に入りリスト
    final favoritesAsyncValue = ref.watch(favoriteItemProvider);
    // アイテム名の最大文字数
    const itemNameMaxLength = 40;
    final theme = Theme.of(context);
    // final item = timelineItem.entity;
    final itemNameLength = item.name.length;
    // 最大文字数を超えていた場合は最大文字数でカットする
    final itemName = item.name.substring(
      0,
      itemNameLength > itemNameMaxLength ? itemNameMaxLength : itemNameLength,
    );
    final itemCount = '${item.numberOfItems.toInt()}';
    final storongStyle = theme.textTheme.bodyText2!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    return favoritesAsyncValue.when(
      loading: () => const LoadingIndicator(),
      error: (error, stack) => ErrorWidget(error),
      data: (favoriteItems) {
        final isFavorited = favoriteItems.firstWhereOrNull(
              (doc) => doc.entity!.asin == item.asin,
            ) !=
            null;
        return Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                // アイテム画像
                Column(
                  children: [
                    UrlImage(
                      item.imageUrlSmall,
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(height: 8),
                    FittedBox(child: _CreatedAtText(date: item.createdAt)),
                  ],
                ),
                const SizedBox(width: 16),
                // 画像以外（アイテム名など）
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // アイテム名
                      Text.rich(
                        TextSpan(
                          text: '',
                          style: theme.textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          children: [
                            if (item.expirationAt != null)
                              TextSpan(
                                text: '期限まで ',
                                children: [
                                  TextSpan(
                                    text:
                                        '''${item.expirationAt!.difference(DateTime.now()).inDays}''',
                                    style: storongStyle,
                                  ),
                                  const TextSpan(
                                    text: ' 日の',
                                  ),
                                ],
                              ),
                            const TextSpan(
                              text: '「',
                            ),
                            TextSpan(
                              text: itemName,
                              style: storongStyle,
                            ),
                            const TextSpan(
                              text: '」 が ',
                            ),
                            TextSpan(
                              text: itemCount,
                              style: storongStyle,
                            ),
                            const TextSpan(
                              text: ' 個 ストックされました！',
                            ),
                          ],
                        ),
                        maxLines: 4,
                      ),
                      // アイコンボタン
                      IconButtonsOnCell(
                        isFavorited: isFavorited,
                        onPressedAddButton: () => _didTapCreateButton(
                          ref: ref,
                          context: context,
                          item: item,
                        ),
                        onPressedFavoriteButton: () => _didTapFavoritesButton(
                          ref: ref,
                          context: context,
                          timelineItem: item,
                          favoritesCount: favoriteItems.length,
                          isFavorited: isFavorited,
                        ),
                        onPressedAmazonButton: () => _didTapAmazonButton(
                          url: item.amazonUrl,
                        ),
                        onPressedShareButton: () => _didTapShareButton(
                          context: context,
                          item: item,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// ストックアイテムを作成するボタンが押された
  Future<void> _didTapCreateButton({
    required WidgetRef ref,
    required BuildContext context,
    required EveryonesStockModel item,
  }) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    final scaffold = ScaffoldMessenger.of(context);
    // Providerにドキュメントをセット
    ref.read(stockEditorParameterProvider.state).state =
        StockEditorParameter.createrWithAmazon(
      stock: StockEntity.fromTimelineItem(item),
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
    required EveryonesStockModel timelineItem,
    required int favoritesCount,
    required bool isFavorited,
  }) async {
    var snackText = '';
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    if (isFavorited) {
      // お気に入り解除
      snackText =
          await ref.read(favoriteProvider).removeFavorite(timelineItem.asin);
    } else {
      // お気に入り追加
      final favoriteItem = FavoriteItem.fromTimelineItem(timelineItem);
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
    required EveryonesStockModel item,
  }) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    shareWithEveryonesStock(
      item,
      size: MediaQuery.of(context).size,
    );
  }
}

/// 登録日（相対）を表示
class _CreatedAtText extends StatelessWidget {
  const _CreatedAtText({
    required this.date,
  });

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(date!);
    var text = '${diff.inDays}日';
    if (diff.inDays == 0) {
      text = '${diff.inHours}時間';
    }
    if (diff.inDays == 0 && diff.inHours == 0) {
      text = '${diff.inMinutes}分';
    }
    return Text(
      ' $text',
      style: Theme.of(context).textTheme.caption,
    );
  }
}
