import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../commons/hooks/use_localization.dart';
import '../../domain/authenticator/apple_authenticator.dart';
import '../../domain/authenticator/authenticator.dart';
import '../../domain/authenticator/sign_in_method.dart';
import '../components/rounded_card.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  static const routeName = 'account';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final isAnonymous = ref.watch(isAnonymousSignedInProvider);
    final googleEmail = ref.watch(googleEmailProvider);
    final isGoogleSigneIn = googleEmail != null;
    final canSignInWithApple =
        ref.watch(canSignInWithAppleProvider).value ?? false;
    final appleEmail = ref.watch(appleEmailProvider);
    final isAppleSigneIn = ref.watch(isAppleSignedInProvider);

    final googleSignInVisibled = !isGoogleSigneIn;
    final appleSignInVisibled = canSignInWithApple && !isAppleSigneIn;
    final signOutVisibled = !isAnonymous;

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
              if (googleSignInVisibled)
                _Card(
                  isFirst: true,
                  isLast: !appleSignInVisibled,
                  titleLabel: 'Sign in with Google',
                  icon: const Icon(MdiIcons.google),
                  onTap: ref.read(authenticatorProvider).signInWithGoogle,
                ),
              if (appleSignInVisibled)
                _Card(
                  isFirst: isGoogleSigneIn,
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
              isLast: !canSignInWithApple,
              isSigneIn: isGoogleSigneIn,
              email: googleEmail,
              titleLabel: SignInMethod.google.label(context),
              link: ref.read(authenticatorProvider).linkGoogleAccount,
              unLink: ref.read(authenticatorProvider).unlinkGoogleAccount,
            ),
            // Apple LinkはiOSかつ匿名ユーザー以外であれば表示する。
            if (canSignInWithApple)
              _ProviderLinkCard(
                isLast: true,
                isSigneIn: isAppleSigneIn,
                email: appleEmail,
                titleLabel: SignInMethod.apple.label(context),
                link: ref.read(authenticatorProvider).linkAppleAccount,
                unLink: ref.read(authenticatorProvider).unlinkAppleAccount,
              ),
            const Gap(8),
            // 匿名ユーザーはサインアウトできない。
            if (signOutVisibled)
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
              isFirst: !signOutVisibled,
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
    Key? key,
    required this.titleLabel,
    this.icon,
    this.needConfirm = false,
    this.confirmMessage,
    this.confirmOkLabel,
    this.isFirst = false,
    this.isLast = false,
    required this.onTap,
  })  : assert(
          needConfirm && confirmOkLabel != null ||
              !needConfirm && confirmMessage == null && confirmOkLabel == null,
        ),
        super(key: key);

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
    final l10n = useL10n();

    void showConfirm() {
      final confirmMessage = this.confirmMessage;
      showDialog<void>(
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
    Key? key,
    required this.isSigneIn,
    required this.titleLabel,
    required this.email,
    required this.link,
    required this.unLink,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  final bool isSigneIn;
  final String titleLabel;
  final String? email;
  final bool isFirst;
  final bool isLast;
  final VoidCallback link;
  final VoidCallback unLink;

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();

    void showConfirm() {
      showDialog<void>(
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
        leading: Icon(isSigneIn ? Icons.check : Icons.add_link),
        title: Text(titleLabel),
        trailing: isSigneIn
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
        onTap: isSigneIn ? null : link,
      ),
    );
  }
}
