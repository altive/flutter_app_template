import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/notification_service/notification_service.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../util/shared_preferences_service.dart';
import 'stock_editor_controller.dart';

/// 通知をON/OFFするセル
class StockEditorNotificationTile extends HookWidget {
  const StockEditorNotificationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final stockEditorState = useProvider(stockEditorPageControllerProvider);
    // 何日前に通知するか
    final durationDays =
        useProvider(sharedPreferencesServiceProvider).getNotificationDuration;
    // 期限日
    final expirationAt = stockEditorState.expirationDate ?? DateTime.now();
    // 通知予定日
    final notificationAt =
        expirationAt.subtract(Duration(days: durationDays.count));
    // 通知予定日がもう過ぎてしまっているか
    final isDatePassed = DateTime.now().isAfter(notificationAt);
    // 期限の種類
    final expirationType = stockEditorState.expirationDateType;

    return Visibility(
      visible: expirationType != ExpirationDateType.none,
      child: Ink(
        color: theme.backgroundColor,
        child: SwitchListTile.adaptive(
          dense: true,
          secondary: Text(
            '通知',
            style: theme.textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          activeColor: Theme.of(context).colorScheme.primary,
          title: Text('期限の${durationDays.label}にお知らせ'),
          value: stockEditorState.isNotificationEnabled,
          onChanged: (isOn) => isOn
              ? _onNotificationEnabled(
                  context: context,
                  isDatePassed: isDatePassed,
                  numberOfItems: stockEditorState.numberOfItems,
                )
              : _onNotificationDisabled(context: context),
        ),
      ),
    );
  }

  /// 通知のトグルがOFFにされた
  void _onNotificationDisabled({
    required BuildContext context,
  }) {
    // ToggleをOFFにする（その場で削除はしない）
    context
        .read(stockEditorPageControllerProvider.notifier)
        .toggleNotification(isEnabled: false);
  }

  /// 通知のトグルがONにされた
  /// 通知予定日が過去日であれば[isDatePassed]が`true`
  Future<void> _onNotificationEnabled({
    required BuildContext context,
    required bool isDatePassed,
    required int numberOfItems,
  }) async {
    final scaffold = ScaffoldMessenger.of(context);

    if (isDatePassed) {
      // ①通知日が現在を過ぎている場合はONにできない
      scaffold
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('通知予定日を過ぎているため通知をONにできません'),
          ),
        );
      return;
    }

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
    final hasNotificationGranted = await context
        .read(notificationControllerProvider.notifier)
        .hasNotificationGranted;
    if (hasNotificationGranted == false) {
      // ③通知の許可を訴求したが、拒否されている場合は、設定画面へ促す
      return _showSettingDialog(context);
    }
    // nullableではないので不必要
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
    // 許可状態だった or 今回許可された場合のみ、通知ToggleをONにできる
    final result = await context
        .read(stockEditorPageControllerProvider.notifier)
        .toggleNotification(isEnabled: true);
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
