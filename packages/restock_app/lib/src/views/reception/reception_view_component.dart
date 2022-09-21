import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/remote_config/remote_config_provider.dart';
import '../../util/web_launcher.dart';

/// 利用規約ボタン
class TermsButton extends ConsumerWidget {
  const TermsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        ref
            .read(remoteConfigProvider)
            .whenData((value) => launchWeb(value!.termsUrl));
      },
      child: const Text(
        '利用規約',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

/// プライバシーポリシーボタン
class PrivacyButton extends ConsumerWidget {
  const PrivacyButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        ref
            .read(remoteConfigProvider)
            .whenData((value) => launchWeb(value!.privacyPoliciesUrl));
      },
      child: const Text(
        'プライバシーポリシー',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
