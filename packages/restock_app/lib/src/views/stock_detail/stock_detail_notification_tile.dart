import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_receiver/notification_receiver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import 'stock_detail_page_controller.dart';

/// 通知をON/OFFするセル
class StockDetailNotificationTile extends HookConsumerWidget {
  const StockDetailNotificationTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expirationAt = ref.watch(
      stockForStockDetailProvider
          .select<DateTime?>((value) => value?.expirationAt),
    );
    if (expirationAt == null) {
      return const SizedBox();
    }
    final idNumber = ref.watch(
      stockForStockDetailProvider.select<int?>((value) => value?.idNumber),
    );
    final isOn = ref.watch(
      localNotificationControllerProvider
          .select<bool>((value) => value.contains(idNumber)),
    );

    final controller = ref.watch(stockDetailPageControllerProvider.notifier);

    return FutureBuilder<NotificationPayload?>(
      future: controller.fetchNotificationPayload(),
      builder: (context, snapshot) {
        final payload = snapshot.data;
        final notificationTime = controller.getNotificationTimes(payload);
        final durationDays = controller.getNotificationDuration(payload);
        return SwitchListTile.adaptive(
          dense: true,
          activeColor: Theme.of(context).colorScheme.primary,
          title: Text(
            '通知',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            isOn
                ? '''期限$durationDays日前の${notificationTime.format(context)}に通知予定です。'''
                : '''期限$durationDays日前の${notificationTime.format(context)}に通知しますか？''',
          ),
          value: isOn,
          onChanged: (isOn) => isOn
              ? _onNotificationEnabled(
                  ref: ref,
                  context: context,
                )
              : _onNotificationDisabled(ref: ref, context: context),
        );
      },
    );
  }

  /// 通知のトグルがOFFにされた
  void _onNotificationDisabled({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    // 通知を削除する
    ref.read(stockDetailPageControllerProvider.notifier).removeNotification();
  }

  /// 通知のトグルがONにされた
  Future<void> _onNotificationEnabled({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final numberOfItems = ref.read(stockForStockDetailProvider)!.numberOfItems;
    final isZeroCount = numberOfItems < 1;
    if (isZeroCount) {
      // ②ストックが0個のため通知はONにできない
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('ストックが0個のため通知をONにできません'),
          ),
        );
      return;
    }

    final settings = await ref.read(notificationSettingsProvider.future);
    if (settings.isNotAuthorized) {
      // ③通知の権限が拒否されている場合は、設定画面へ促す
      return _showSettingDialog(context);
    }

    // 通知ToggleをONにできる
    final result = await ref
        .read(stockDetailPageControllerProvider.notifier)
        .addNotification();
    if (result == null) {
      return;
    }
    // 失敗したらトーストで理由を表示する
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(result)));
  }

  /// 通知の設定を開くダイアログを表示する
  Future<void> _showSettingDialog(BuildContext context) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      message: 'ストックの期限を通知するために、設定アプリから「通知」をONにしてください。',
      okLabel: '設定を開く',
      cancelLabel: 'キャンセル',
      defaultType: OkCancelAlertDefaultType.ok,
    );
    switch (result) {
      case OkCancelResult.ok:
        await openAppSettings();
        return;
      case OkCancelResult.cancel:
        return;
    }
  }
}
