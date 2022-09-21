import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import 'constant.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
    this.labelText = 'Sign in with Google',
    required this.onPressed,
  });

  final String labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isLightTheme ? Colors.black : Colors.white,
        shape: StadiumBorder(
          side: isLightTheme ? const BorderSide() : BorderSide.none,
        ),
      ),
      icon: SizedBox.square(
        dimension: 20,
        child: Assets.googleLogo.svg(package: packageName),
      ),
      label: Text(labelText),
    );
  }
}
