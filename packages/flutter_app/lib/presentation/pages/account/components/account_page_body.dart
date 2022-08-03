import 'package:awaitable_button/awaitable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/authenticator/authenticator.dart';
import '../../../../util/localizer/localizer.dart';
import '../../../router/router.dart';

class AccountPageBody extends HookConsumerWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final l10n = L10n.of(context);
    final authenticator = ref.watch(authenticatorProvider);
    Future<void> signOut() async {
      final isBool = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign out'),
            content: const Text('Really?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.buttonCancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(l10n.buttonSignOut),
              )
            ],
          );
        },
      );
      if (isBool != true) {
        return;
      }
      final signedOut = await authenticator.signOut();
      if (signedOut && isMounted()) {
        // ignore: use_build_context_synchronously
        const SigninRoute().go(context);
      } else {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Failed'),
            );
          },
        );
      }
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          title: const Text('UID:'),
          subtitle: Text(ref.watch(uidProvider).value ?? 'none'),
        ),
        AwaitableTextButton<void>(
          onPressed: signOut,
          child: Text(l10n.buttonSignOut),
        ),
      ],
    );
  }
}
