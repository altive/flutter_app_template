import 'package:authenticator/authenticator.dart';
import 'package:awaitable_button/awaitable_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/strings.g.dart';

class AccountPageBody extends HookConsumerWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = Translations.of(context);
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
                child: Text(i18n.button.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(i18n.button.sign.out),
              ),
            ],
          );
        },
      );
      if (isBool != true) {
        return;
      }
      await authenticator.signOut();
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
          child: Text(i18n.button.sign.out),
        ),
      ],
    );
  }
}
