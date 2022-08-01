import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_receiver/notification_receiver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../util/shared_preferences_service.dart';
import 'stock_editor_controller.dart';

/// 通知をON/OFFするセル
class StockEditorNotificationTile extends HookConsumerWidget {
  const StockEditorNotificationTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final stockEditorState = ref.watch(stockEditorPageControllerProvider);
    // 何日前に通知するか
    final durationDays =
        ref.watch(sharedPreferencesServiceProvider).getNotificationDuration;
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
                  ref: ref,
                  context: context,
                  isDatePassed: isDatePassed,
                  numberOfItems: stockEditorState.numberOfItems,
                )
              : _onNotificationDisabled(ref: ref, context: context),
        ),
      ),
    );
  }

  /// 通知のトグルがOFFにされた
  void _onNotificationDisabled({
    required WidgetRef ref,
    required BuildContext context,
  }) {
    // ToggleをOFFにする（その場で削除はしない）
    ref
        .read(stockEditorPageControllerProvider.notifier)
        .toggleNotification(isEnabled: false);
  }

  /// 通知のトグルがONにされた
  /// 通知予定日が過去日であれば[isDatePassed]が`true`
  Future<void> _onNotificationEnabled({
    required WidgetRef ref,
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

    final settings = await ref.read(notificationSettingsProvider.future);
    if (settings.isNotAuthorized) {
      // ③通知の権限が拒否されている場合は、設定画面へ促す
      return _showSettingDialog(context);
    }

    // 通知ToggleをONにできる
    final result = await ref
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
