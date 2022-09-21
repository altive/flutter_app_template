import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/authenticator/sign_with_apple_service.dart';
import '../views/reception/reception_controller.dart';

class SignInWithAppleButton extends HookConsumerWidget {
  const SignInWithAppleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    final canSignInWithApple =
        ref.watch(canSignInWithAppleProvider).valueOrNull;

    if (canSignInWithApple == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 16, 40, 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 44,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(
              side: isLightTheme ? const BorderSide() : BorderSide.none,
            ),
          ),
          onPressed: () async => ref
              .read(receptionProvider.notifier)
              .onPressedAppleButton(context),
          icon: Image.asset(
            isLightTheme
                ? 'assets/images/apple_logo_white.png'
                : 'assets/images/apple_logo_black.png',
          ),
          clipBehavior: Clip.hardEdge,
          label: const Text('Appleで続ける'),
        ),
      ),
    );
  }
}
