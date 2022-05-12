import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/authenticator/sign_with_apple_service.dart';
import '../views/reception/reception_controller.dart';

class SignInWithAppleButton extends HookConsumerWidget {
  // ----------------------------------
  // Constructor
  // ----------------------------------
  const SignInWithAppleButton();

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return FutureBuilder<bool>(
      future: canSignInWithApple,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data ?? false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 16, 40, 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 44,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: isLightTheme ? Colors.black : Colors.white,
                  shape: StadiumBorder(
                    side: isLightTheme ? const BorderSide() : BorderSide.none,
                  ),
                ),
                // タップした時に色の変化があるが、使用している画像の背景色が透明ではないので、
                // 不自然な表現になってしまう。回避策としてタップ時の色変更を透明（なし）にしている
                // highlightColor: Colors.transparent,
                // splashColor: Colors.transparent,
                onPressed: () => ref
                    .read(receptionProvider.notifier)
                    .onPressedAppleButton(context),
                icon: Image.asset(
                  isLightTheme
                      ? 'assets/images/apple_logo_white.png'
                      : 'assets/images/apple_logo_black.png',
                ),
                clipBehavior: Clip.hardEdge,
                label: Text(
                  'Appleで続ける',
                  style: TextStyle(
                    color: isLightTheme ? Colors.white : Colors.black,
                    fontSize: 19, // HIGによると、最小19サイズ
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
