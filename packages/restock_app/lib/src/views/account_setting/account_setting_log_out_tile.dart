import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/authenticator/auth_controller.dart';
import '../reception/reception_view.dart';
import 'account_setting_page_controller.dart';

/// ログアウトボタン
class AccountSettingLogOutTile extends HookConsumerWidget {
  const AccountSettingLogOutTile();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    final authController = ref.watch(authControllerProvider.notifier);
    if (user == null) {
      return const SizedBox();
    }
    return Visibility(
      // 匿名認証では非表示
      visible: !authController.isAnonymous(user: user),
      child: ListTile(
        leading: const Icon(MdiIcons.logout),
        title: const Text('ログアウト'),
        onTap: () => _presentConfirmDialog(ref, context),
      ),
    );
  }

  /// ログアウトするかの確認ダイアログを表示
  Future<void> _presentConfirmDialog(
    WidgetRef ref,
    BuildContext context,
  ) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: '期限の通知がすべてOFFになります',
    );
    switch (result) {
      case OkCancelResult.ok:
        final isSucceeded = await ref
            .read(accountSettingPageControllerProvider.notifier)
            .logOut();
        if (isSucceeded) {
          return _popToReceptionPage(context);
        }
        await showOkAlertDialog(context: context, title: 'ログアウトに失敗しました');
        return;

      case OkCancelResult.cancel:
        return;
    }
  }

  /// 受付画面へ遷移
  void _popToReceptionPage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      ReceptionPage.routeName,
      (_) => false,
    );
  }
}
