import 'package:flutter/widgets.dart';

import '../../l10n/l10n.dart';

/// サインインの方法
enum SignInMethod {
  anonymous,
  apple,
  google,
  // 以下、当アプリでは未使用なサインイン方法のためコメントアウト
  // phone,
  // emailLink,
}

extension SignInMethodExt on SignInMethod {
  /// ラベル文字列
  String label(BuildContext context) {
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
  String get id {
    switch (this) {
      case SignInMethod.anonymous:
        return 'firebase';
      case SignInMethod.apple:
        return 'apple.com';
      case SignInMethod.google:
        return 'google.com';
      // case SignInMethod.phone:
      //   return 'phone';
      // case SignInMethod.emailLink:
      //   // メールリンク認証でも UserInfo.providerId は `password` になる。
      //   return 'password';
    }
  }
}
