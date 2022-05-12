import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../core/stock/stock_entity.dart';
import '../stock_detail/stock_detail_page.dart';
import '../stock_detail/stock_detail_page_controller.dart';
import 'stock_list_image_view.dart';

/// グリッドで表示するカード。単一のアイテム情報を表示する
class StockListGridCard extends StatelessWidget {
  const StockListGridCard({
    required this.stock,
    required this.isTopLeft,
    required this.isTopRight,
    required this.isBottomLeft,
    required this.isBottomRight,
    required this.imageHeight,
  });

  final StockEntity stock;
  final bool isTopLeft;
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Card(
          stock: stock,
          isTopLeft: isTopLeft,
          isTopRight: isTopRight,
          isBottomLeft: isBottomLeft,
          isBottomRight: isBottomRight,
          imageHeight: imageHeight,
        ),
        Positioned(
          top: 4,
          right: 4,
          child: _NotificationIcon(stock: stock),
        ),
      ],
    );
  }
}

/// 表示するカード本体
class _Card extends ConsumerWidget {
  const _Card({
    required this.stock,
    required this.isTopLeft,
    required this.isTopRight,
    required this.isBottomLeft,
    required this.isBottomRight,
    required this.imageHeight,
  });

  final StockEntity stock;
  final bool isTopLeft;
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;
  final double imageHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    const radius = Radius.circular(16);
    return GestureDetector(
      onTap: () async {
        // 詳細画面へ遷移
        ref.read(selectedStockIdForStockDetailProvider.state).state = stock.id!;
        final result =
            await Navigator.of(context).pushNamed(StockDetailPage.routeName);
        // 何か返ってきた時のみスナックバーを表示する
        if (result == null) {
          messenger.removeCurrentSnackBar();
          return;
        }
        messenger
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('$result')));
      },
      child: Card(
        elevation: 0,
        // デフォルトでマージンが4pxあった
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: isTopLeft ? radius : Radius.zero,
            topRight: isTopRight ? radius : Radius.zero,
            bottomLeft: isBottomLeft ? radius : Radius.zero,
            bottomRight: isBottomRight ? radius : Radius.zero,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StockListImageView(
                stock,
                size: imageHeight,
              ),
              Text(
                stock.name.value,
                style: Theme.of(context).textTheme.caption,
                maxLines: 2,
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.bold),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _ExpirationText(
                      date: stock.expirationAt,
                      hasStock: stock.numberOfItems > 0,
                    ),
                    _ItemCountText(
                      itemCount: stock.numberOfItems.toInt(),
                    ),
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

/// アイテム個数を表示するTextWidget
class _ItemCountText extends StatelessWidget {
  const _ItemCountText({
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: itemCount > 0,
      child: Text('$itemCount個'),
    );
  }
}

/// ストックの期限を表示
class _ExpirationText extends StatelessWidget {
  const _ExpirationText({
    required this.date,
    required this.hasStock,
  });

  final DateTime? date;
  final bool hasStock;

  @override
  Widget build(BuildContext context) {
    if (date == null) {
      return const Text('期限なし');
    }
    if (!hasStock) {
      return const Text('在庫なし');
    }
    final diff = date!.difference(DateTime.now());
    // 当日が期限
    if (diff.inDays == 0 && diff.isNegative) {
      return Text(
        '今日まで',
        style: Theme.of(context).textTheme.overline!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
      );
    }
    // 明日が期限
    if (diff.inDays == 0) {
      return Text(
        '明日まで',
        style: Theme.of(context).textTheme.overline!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
      );
    }
    // 期限が過ぎている
    if (diff.isNegative) {
      return Text(
        '-${-diff.inDays}日',
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: Theme.of(context).colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
      );
    }
    // 残り日数を表示
    if (diff.inDays <= 7) {
      return Text(
        'あと${diff.inDays}日',
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
      );
    }

    // 残り日数を表示
    if (diff.inDays <= 90) {
      return Text('あと${diff.inDays}日');
    }

    // それ以降は日付を表示
    return Text(
      DateFormat.yMMM().format(date!),
      style: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

/// 通知が登録されている場合に表示するアイコン
class _NotificationIcon extends HookConsumerWidget {
  const _NotificationIcon({
    required this.stock,
  });

  final StockEntity stock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationList = ref.watch(localNotificationControllerProvider);
    if (!notificationList.contains(stock.idNumber)) {
      return const SizedBox();
    }
    return CircleAvatar(
      foregroundColor: Theme.of(context).backgroundColor,
      backgroundColor: Theme.of(context).colorScheme.primary,
      radius: 14,
      child: const Icon(
        Icons.alarm_on,
        size: 20,
      ),
    );
  }
}
