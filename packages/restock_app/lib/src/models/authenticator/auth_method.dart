/// サインインの方法
enum AuthMethod {
  anonymous,
  apple,
  google,
}

extension KeyToString on AuthMethod {
  /// enumの文字列を返却
  String get key => toString().split('.').last;

  /// 日本語ラベル
  String? get name {
    switch (this) {
      case AuthMethod.anonymous:
        return '匿名';
      case AuthMethod.apple:
        return 'Apple';
      case AuthMethod.google:
        return 'Google';
    }
  }

  /// Provider ID
  String? get id {
    switch (this) {
      case AuthMethod.anonymous:
        return 'firebase';
      case AuthMethod.apple:
        return 'apple.com';
      case AuthMethod.google:
        return 'google.com';
    }
  }
}
