import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../core/stock/stock_entity.dart';
import '../stock_detail/stock_detail_page.dart';
import '../stock_detail/stock_detail_page_controller.dart';
import 'stock_list_image_view.dart';

/// リストで表示するカード。一つのアイテム情報を表示する
class HomeItemCard extends StatelessWidget {
  const HomeItemCard({
    super.key,
    required this.stock,
    required this.isFirstItem,
    required this.isLastItem,
  });

  final StockEntity stock;
  final bool isFirstItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Card(
          stock: stock,
          isFirstItem: isFirstItem,
          isLastItem: isLastItem,
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

/// 表示するカード本体
class _Card extends ConsumerWidget {
  const _Card({
    required this.stock,
    required this.isFirstItem,
    required this.isLastItem,
  });

  final StockEntity stock;
  final bool isFirstItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const radius = Radius.circular(16);
    final messenger = ScaffoldMessenger.of(context);
    return Card(
      elevation: 0,
      // デフォルトでマージンが4pxあった
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: isFirstItem ? radius : Radius.zero,
          topRight: isFirstItem ? radius : Radius.zero,
          bottomLeft: isLastItem ? radius : Radius.zero,
          bottomRight: isLastItem ? radius : Radius.zero,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        dense: true,
        onTap: () async {
          // 詳細画面へ遷移
          ref.read(selectedStockIdForStockDetailProvider.state).state =
              stock.id!;
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
        leading: StockListImageView(
          stock,
          size: 48,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(stock.name.value),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 16,
              children: <Widget>[
                _ExpirationText(
                  date: stock.expirationAt,
                  hasStock: stock.numberOfItems > 0,
                ),
                _ItemCountText(
                  itemCount: stock.numberOfItems.toInt(),
                  stockCategory: stock.stockCategory,
                ),
              ],
            ),
            if (stock.memo != null)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('${stock.memo}'),
              ),
          ],
        ),
      ),
    );
  }
}

/// アイテム個数を表示するTextWidget
class _ItemCountText extends StatelessWidget {
  const _ItemCountText({
    required this.itemCount,
    required this.stockCategory,
  });

  final int itemCount;
  final String? stockCategory;

  @override
  Widget build(BuildContext context) {
    final categoryText = stockCategory == null ? '' : '$stockCategory：';
    return Visibility(
      visible: itemCount > 0,
      child: Text('$categoryText $itemCount個'),
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
      return Text(DateFormat.yMMMEd().format(date!));
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
        '期限が ${-diff.inDays}日 過ぎています',
        style: Theme.of(context).textTheme.overline!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
      );
    }
    // 残り日数を表示
    if (diff.inDays <= 7) {
      return Text(
        'あと${diff.inDays}日',
        style: Theme.of(context).textTheme.overline!.copyWith(
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
    return Text(DateFormat.yMMMEd().format(date!));
  }
}
