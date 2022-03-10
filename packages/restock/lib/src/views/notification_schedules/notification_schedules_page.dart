import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../core/notification_service/notification_service.dart';
import '../../core/stock/stock_entity.dart';
import '../../core/stock/stock_repository.dart';

final notificationScheduleListProvider =
    FutureProvider.autoDispose((ref) async {
  //
  final pendingList = await ref
      .watch(notificationControllerProvider.notifier)
      .getAndStorePendingNotificationRequests;

  final payloadList = pendingList.map((e) {
    final json = jsonDecode(e.payload!) as Map<String, Object>;
    return NotificationPayload.fromJson(json);
  }).toList();

  final stockList = <StockEntity>[];
  final repository = ref.watch(stockRepositoryProvider);
  if (repository != null) {
    for (final payload in payloadList) {
      stockList.add(
        await repository.fetch(payload.documentId),
      );
    }
  }
  return Tuple2(payloadList, stockList);
});

class NotificationSchedulesPage extends HookWidget {
  // Constructor
  const NotificationSchedulesPage({
    Key? key,
  }) : super(key: key);

  // Field
  static const String routeName = '/notification-requests';

  // Methods
  @override
  Widget build(BuildContext context) {
    final list = useProvider(notificationScheduleListProvider);
    if (list.data == null) {
      return const LoadingIndicator();
    }
    final tuple = list.data!.value;
    final payloadList = tuple.item1;
    final stockList = tuple.item2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知予定'),
        actions: <Widget>[
          TextButton(
            onPressed: () => _cancelAllNotifications(context),
            child: const Text('すべて削除'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemCount: payloadList.length,
          itemBuilder: (context, index) {
            final payload = payloadList[index];
            final stock = stockList[index];
            return NotificationTile(
              idNumber: stock.idNumber,
              notificationPayload: payload,
              stock: stock,
            );
          },
        ),
      ),
    );
  }

  /// 確認後、すべての通知をキャンセルする
  Future<void> _cancelAllNotifications(BuildContext context) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: '通知をすべて削除',
      message: '登録済みの期限切れ通知をすべて削除します。',
      okLabel: 'すべて削除',
      defaultType: OkCancelAlertDefaultType.cancel,
      isDestructiveAction: true,
    );
    switch (result) {
      case OkCancelResult.ok:
        await context
            .read(notificationControllerProvider.notifier)
            .canceleAll();
        Navigator.of(context).pop();
        break;
      case OkCancelResult.cancel:
        break;
    }
  }
}

/// 1つの通知情報を表示する
/// ストックアイテムの名前・期限日・○日前か
class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    required this.idNumber,
    required this.notificationPayload,
    required this.stock,
  }) : super(key: key);

  final int? idNumber;
  final NotificationPayload notificationPayload;
  final StockEntity stock;

  @override
  Widget build(BuildContext context) {
    var notificationDateText = '';

    final notificationDaysString =
        '${notificationPayload.notificationDurationDays}日前';
    final notificationTimeString =
        '${notificationPayload.hour}時${notificationPayload.minute}分';
    notificationDateText = '$notificationDaysStringの$notificationTimeString';

    final expirationString = '期限日：${stock.displayExpirationDate}';
    return ColoredBox(
      color: Theme.of(context).backgroundColor,
      child: Dismissible(
        key: Key(notificationPayload.documentId.toString()),
        direction: DismissDirection.startToEnd,
        background: const DeletableBackground(label: '削除'),
        confirmDismiss: (direction) => _confirm(
          context: context,
          direction: direction,
        ),
        onDismissed: (direction) => _onDismissed(
          direction: direction,
          context: context,
          notificationIdNumber: idNumber!,
        ),
        child: ListTile(
          // leading: Text(item.id.toString()),
          title: Text(stock.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(expirationString),
              Text('$notificationDateTextに通知'),
            ],
          ),
          // trailing: Text(item.payload),
        ),
      ),
    );
  }

  /// 削除前に確認
  Future<bool> _confirm({
    required BuildContext context,
    required DismissDirection direction,
  }) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      message: '削除しますか？',
      okLabel: '削除',
      cancelLabel: 'キャンセル',
      isDestructiveAction: true,
    );
    return result == OkCancelResult.ok;
  }

  /// スワイプした時の動作
  void _onDismissed({
    DismissDirection? direction,
    required BuildContext context,
    required int notificationIdNumber,
  }) {
    // 対象の通知をキャンセル
    context
        .read(notificationControllerProvider.notifier)
        .cancele(id: notificationIdNumber);
  }
}
