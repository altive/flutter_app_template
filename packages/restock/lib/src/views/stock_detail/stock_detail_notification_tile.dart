import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/notification_service/notification_service.dart';
import 'stock_detail_page_controller.dart';

/// 通知をON/OFFするセル
class StockDetailNotificationTile extends HookConsumerWidget {
  const StockDetailNotificationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expirationAt = ref.watch(stockForStockDetailProvider
        .select<DateTime?>((value) => value?.expirationAt));
    if (expirationAt == null) {
      return const SizedBox();
    }
    final idNumber = ref.watch(
        stockForStockDetailProvider.select<int?>((value) => value?.idNumber));
    final isOn = ref.watch(notificationControllerProvider
        .select<bool>((value) => value.contains(idNumber)));

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
    final scaffold = ScaffoldMessenger.of(context);
    final numberOfItems = ref.read(stockForStockDetailProvider)!.numberOfItems;
    final isZeroCount = numberOfItems < 1;
    if (isZeroCount) {
      // ②ストックが0個のため通知はONにできない
      scaffold
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('ストックが0個のため通知をONにできません'),
          ),
        );
      return;
    }

    // 通知の許可状態
    // MEMO: 本当は通知の訴求ダイアログを開こうとしたんだけど、
    // 拒否状態なのにPermissionで`denied`ではなく`undetermined`が返ってくるので
    // 直接OSのダイアログを開けば開いて、結果拒否でも設定開くダイアログを表示するようにした
    final hasNotificationGranted = await ref
        .read(notificationControllerProvider.notifier)
        .hasNotificationGranted;
    if (hasNotificationGranted == false) {
      // ③通知の許可を訴求したが、拒否されている場合は、設定画面へ促す
      return _showSettingDialog(context);
    }
    // if (hasNotificationGranted == null) {
    //   // ④まだ許可/拒否が未確定の場合は、iOSの通知の許可を得るためのOS標準ダイアログを表示する
    //   final selectedPermission = await context
    //       .read(notificationControllerProvider.notifier)
    //       .requestLocalNotificationPermission();
    //   logger.fine('通知の許可： $selectedPermission');
    //   if (selectedPermission == false) {
    //     // 拒否された場合は設定画面へ促す
    //     return _showSettingDialog(context);
    //   }
    // }
    // 許可状態だった or 今回許可された場合のみ、通知を追加する
    final result = await ref
        .read(stockDetailPageControllerProvider.notifier)
        .addNotification();
    if (result == null) {
      return;
    }
    // 失敗したらトーストで理由を表示する
    scaffold
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
        defaultType: OkCancelAlertDefaultType.ok);
    switch (result) {
      case OkCancelResult.ok:
        await openAppSettings();
        return;
      case OkCancelResult.cancel:
        return;
    }
  }
}
