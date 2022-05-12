import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/authenticator/auth_controller.dart';
import '../../models/authenticator/auth_error_code.dart';
import '../../utils/utils.dart';
import 'account_setting_page_controller.dart';

/// Googleと連携
class AccountSettingGoogleTile extends HookConsumerWidget {
  const AccountSettingGoogleTile();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    final userInfo =
        ref.watch(authControllerProvider.notifier).googleUserInfo(user: user);
    return ListTile(
      leading: const Icon(MdiIcons.google),
      title: Text(userInfo == null ? 'Googleアカウントと連携する' : 'Googleアカウント'),
      subtitle: userInfo == null
          ? null
          : Text(
              userInfo.email!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _presentConfirmDialog(
        ref: ref,
        context: context,
        hasGoogleLinked: userInfo != null,
      ),
    );
  }

  /// リンクの確認ダイアログを表示
  Future<void> _presentConfirmDialog({
    required WidgetRef ref,
    required BuildContext context,
    required bool hasGoogleLinked,
  }) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title:
          hasGoogleLinked ? 'Googleアカウントとの連携を解除しますか？' : 'Googleアカウントと連携しますか？',
    );
    switch (result) {
      case OkCancelResult.ok:
        await _linkOrUnlinkAccount(ref, context);
        return;

      case OkCancelResult.cancel:
        return;
    }
  }

  /// Google連携or解除
  Future<void> _linkOrUnlinkAccount(WidgetRef ref, BuildContext context) async {
    try {
      final result = await ref
          .read(accountSettingPageControllerProvider.notifier)
          .linkOrUnlinkGoogleAccount();
      if (result == null) {
        // キャンセルの場合はトースト表示しない
        return;
      }
      // 結果をトースト表示する
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(result)));
    } on FirebaseAuthException catch (exception) {
      // FirebaseAuthの例外処理
      logger.warning(exception);
      switch (exception.code) {
        case AuthErrorCode.credentialAlreadyInUse:
          await showOkAlertDialog(
            context: context,
            title: 'このGoogleアカウントは他のユーザーが既に使用しています。',
          );
          return;
        default:
      }
      await showOkAlertDialog(
        context: context,
        title: 'Googleアカウントとの連携または解除に失敗しました',
      );
    } on Exception catch (exception) {
      // その他の例外処理
      logger.warning(exception);
      await showOkAlertDialog(
        context: context,
        title: 'Googleアカウントとの連携または解除に失敗しました',
        message: exception.toString(),
      );
    }
  }
}
