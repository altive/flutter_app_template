import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../views/reception/reception_controller.dart';

class GoogleAuthButton extends HookConsumerWidget {
  const GoogleAuthButton({
    this.labelText = 'Sign in with Google',
  });

  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ElevatedButton.icon(
      onPressed: () =>
          ref.read(receptionProvider.notifier).onPressedGoogleButton(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: isLightTheme ? Colors.black : Colors.white,
        shape: StadiumBorder(
          side: isLightTheme ? const BorderSide() : BorderSide.none,
        ),
      ),
      icon: SizedBox.square(
        dimension: 20,
        child: Assets.images.googleLogo.svg(),
      ),
      label: Text(labelText),
    );
  }
}
