import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import 'constant.dart';

/// Button Widget to sign in with your Google account.
class GoogleAuthButton extends StatelessWidget {
  /// Creates a new instance of [GoogleAuthButton].
  ///
  /// The action [onPressed], which is the action when the button is pressed,
  /// is a required field.
  const GoogleAuthButton({
    super.key,
    this.labelText = 'Sign in with Google',
    required this.onPressed,
  });

  /// Label text to be displayed on the button.
  final String labelText;

  /// Callback executed when a button is pressed.
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
