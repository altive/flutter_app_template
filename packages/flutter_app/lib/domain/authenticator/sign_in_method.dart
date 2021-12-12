import 'package:flutter/widgets.dart';

import '../../l10n/l10n.dart';

/// サインインの方法
enum SignInMethod {
  anonymous,
  apple,
  google,
}

extension SignInMethodExt on SignInMethod {
  String labelText(BuildContext context) {
    final l10n = L10n.of(context)!;
    switch (this) {
      case SignInMethod.anonymous:
        return l10n.signInMethodAnonymous;
      case SignInMethod.apple:
        return l10n.signInMethodApple;
      case SignInMethod.google:
        return l10n.signInMethodGoogle;
    }
  }

  /// Provider ID
  String get providerId {
    switch (this) {
      case SignInMethod.anonymous:
        return 'firebase';
      case SignInMethod.apple:
        return 'apple.com';
      case SignInMethod.google:
        return 'google.com';
    }
  }
}
