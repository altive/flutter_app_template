import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../models/authenticator/sign_with_apple_service.dart';
import '../views/reception/reception_controller.dart';

class AppleAuthButton extends HookConsumerWidget {
  const AppleAuthButton({
    this.labelText = 'Sign in with Apple',
  });

  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    final canSignInWithApple =
        ref.watch(canSignInWithAppleProvider).valueOrNull;

    if (canSignInWithApple == null) {
      return const SizedBox.shrink();
    }
    return ElevatedButton.icon(
      onPressed: () async =>
          ref.read(receptionProvider.notifier).onPressedAppleButton(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: isLightTheme ? Colors.black : Colors.white,
        shape: StadiumBorder(
          side: isLightTheme ? const BorderSide() : BorderSide.none,
        ),
      ),
      icon: SizedBox.square(
        dimension: 20,
        child: isLightTheme
            ? Assets.images.appleLogoWhite.svg()
            : Assets.images.appleLogoBlack.svg(),
      ),
      label: Text(labelText),
    );
  }
}
