import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import 'constant.dart';

class AppleAuthButton extends StatelessWidget {
  const AppleAuthButton({
    super.key,
    this.labelText = 'Sign in with Apple',
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
        child: isLightTheme
            ? Assets.appleLogoWhite.svg(package: packageName)
            : Assets.appleLogoBlack.svg(package: packageName),
      ),
      label: Text(labelText),
    );
  }
}
