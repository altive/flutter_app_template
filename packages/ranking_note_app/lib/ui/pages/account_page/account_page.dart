import 'package:authenticator/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../util/localizer/localizer.dart';
import '../../components/rounded_card.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage();

  static const routeName = 'account';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final isAnonymous = ref.watch(isAnonymousSignedInProvider);
    final googleEmail = ref.watch(googleEmailProvider);
    final isGoogleSignedIn = googleEmail != null;
    final appleEmail = ref.watch(appleEmailProvider);
    final isAppleSignedIn = ref.watch(isAppleSignedInProvider);

    final googleSignInEnabled = !isGoogleSignedIn;
    final appleSignInEnabled = !isAppleSignedIn;
    final signOutEnabled = !isAnonymous;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 匿名ユーザーのみ各Providerでサインインが可能
            if (isAnonymous) ...[
              if (googleSignInEnabled)
                _Card(
                  isFirst: true,
                  isLast: !appleSignInEnabled,
                  titleLabel: 'Sign in with Google',
                  icon: const Icon(MdiIcons.google),
                  onTap: ref.read(authenticatorProvider).signInWithGoogle,
                ),
              if (appleSignInEnabled)
                _Card(
                  isFirst: isGoogleSignedIn,
                  isLast: true,
                  titleLabel: 'Sign in with Apple',
                  icon: const Icon(MdiIcons.apple),
                  onTap: ref.read(authenticatorProvider).signInWithApple,
                ),
              const Gap(8),
              Text(
                '機種変更の方は上記からサインインしてください。',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.caption,
              ),
              const Gap(16),
            ],
            // 匿名ユーザー含むユーザーが各Providerへのリンクが可能
            // Google Linkは常に表示する。
            _ProviderLinkCard(
              isFirst: true,
              isLast: !appleSignInEnabled,
              isSignedIn: isGoogleSignedIn,
              email: googleEmail,
              titleLabel: 'Link with Apple',
              link: ref.read(authenticatorProvider).linkWithGoogle,
              unLink: ref.read(authenticatorProvider).unlinkFromGoogle,
            ),
            // Apple LinkはiOSかつ匿名ユーザー以外であれば表示する。
            if (appleSignInEnabled)
              _ProviderLinkCard(
                isLast: true,
                isSignedIn: isAppleSignedIn,
                email: appleEmail,
                titleLabel: 'Link with Google',
                link: ref.read(authenticatorProvider).linkWithApple,
                unLink: ref.read(authenticatorProvider).unlinkFromApple,
              ),
            const Gap(8),
            // 匿名ユーザーはサインアウトできない。
            if (signOutEnabled)
              _Card(
                isFirst: true,
                titleLabel: 'Sign out',
                icon: const Icon(Icons.logout),
                needConfirm: true,
                confirmOkLabel: l10n.buttonSignOut,
                onTap: ref.read(authenticatorProvider).signOut,
              ),
            // アカウント削除は常に可能。
            _Card(
              isFirst: !signOutEnabled,
              isLast: true,
              titleLabel: 'Delete account',
              icon: const Icon(Icons.delete),
              needConfirm: true,
              confirmOkLabel: l10n.buttonDelete,
              onTap: ref.read(authenticatorProvider).deleteAccount,
            ),
            const Gap(16),
            Center(
              child: Text(
                'User ID: ${ref.watch(uidProvider).value ?? "..."}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends HookWidget {
  const _Card({
    required this.titleLabel,
    this.icon,
    this.needConfirm = false,
    this.confirmMessage,
    this.confirmOkLabel,
    this.isFirst = false,
    this.isLast = false,
    required this.onTap,
  }) : assert(
          needConfirm && confirmOkLabel != null ||
              !needConfirm && confirmMessage == null && confirmOkLabel == null,
        );

  final String titleLabel;
  final Icon? icon;
  final bool needConfirm;
  final String? confirmMessage;
  final String? confirmOkLabel;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    Future<void> showConfirm() async {
      final confirmMessage = this.confirmMessage;
      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titleLabel),
            content: confirmMessage == null ? null : Text(confirmMessage),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  l10n.buttonCancel,
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: Text(confirmOkLabel!),
              ),
            ],
          );
        },
      );
    }

    return RoundedCard(
      isFirst: isFirst,
      isLast: isLast,
      child: ListTile(
        leading: icon,
        title: Text(titleLabel),
        trailing: const Icon(Icons.chevron_right),
        onTap: needConfirm ? showConfirm : onTap,
      ),
    );
  }
}

class _ProviderLinkCard extends HookWidget {
  const _ProviderLinkCard({
    required this.isSignedIn,
    required this.titleLabel,
    required this.email,
    required this.link,
    required this.unLink,
    this.isFirst = false,
    this.isLast = false,
  });

  final bool isSignedIn;
  final String titleLabel;
  final String? email;
  final bool isFirst;
  final bool isLast;
  final VoidCallback link;
  final VoidCallback unLink;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    Future<void> showConfirm() async {
      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titleLabel),
            content: const Text('アカウントの連携を解除しますか？'),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  l10n.buttonCancel,
                ),
              ),
              TextButton(
                onPressed: link,
                child: Text(
                  l10n.buttonUnlink,
                ),
              ),
            ],
          );
        },
      );
    }

    return RoundedCard(
      isFirst: isFirst,
      isLast: isLast,
      child: ListTile(
        leading: Icon(isSignedIn ? Icons.check : Icons.add_link),
        title: Text(titleLabel),
        trailing: isSignedIn
            ? TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(44, 44),
                ),
                onPressed: showConfirm,
                child: Text(email ?? '連携済み'),
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(44, 44),
                ),
                onPressed: link,
                child: const Text('連携する'),
              ),
        onTap: isSignedIn ? null : link,
      ),
    );
  }
}
