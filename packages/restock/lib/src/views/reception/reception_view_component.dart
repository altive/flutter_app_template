import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/remote_config/remote_config_provider.dart';
import '../../util/web_launcher.dart';
import 'reception_controller.dart';

// 「Googleでサインイン」ボタン
class GoogleSignInButton extends HookWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 16, 40, 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 44,
        child: TextButton.icon(
          onPressed: () => context
              .read(receptionProvider.notifier)
              .onPressedGoogleButton(context),
          icon: Image.asset('assets/images/btn_google_light_normal.png'),
          label: const Text(
            'Googleで続ける',
            style: TextStyle(
              color: Colors.black,
              fontSize: 19, // Appleのフォントサイズに合わせている
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.white,
            shape: StadiumBorder(
              side: isLightTheme ? const BorderSide(width: 1) : BorderSide.none,
            ),
          ),
          // タップした時に色の変化があるが、使用している画像の背景色が透明ではないので、
          // 不自然な表現になってしまう。回避策としてタップ時の色変更を透明（なし）にしている
          // highlightColor: Colors.transparent,
          // splashColor: Colors.transparent,
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }
}

/// 利用規約ボタン
class TermsButton extends StatelessWidget {
  const TermsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context
            .read(remoteConfigProvider)
            .whenData((value) => launchUrl(value!.termsUrl));
      },
      child: const Text(
        '利用規約',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

/// プライバシーポリシーボタン
class PrivacyButton extends StatelessWidget {
  const PrivacyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context
            .read(remoteConfigProvider)
            .whenData((value) => launchUrl(value!.privacyPoliciesUrl));
      },
      child: const Text(
        'プライバシーポリシー',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
