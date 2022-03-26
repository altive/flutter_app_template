/// 認証エラーのコード
class AuthErrorCode {
  static const emailAlreadyInUse = 'email-already-in-use';
  static const providerAlreadyLinked = 'provider-already-linked';

  /// すでに使われている認証情報だった。
  static const credentialAlreadyInUse = 'credential-already-in-use';

  /// センシティブな処理なので再認証が必要。
  static const requiresRecentLogin = 'requires-recent-login';

  static const tooManyRequests = 'too-many-requests';

  /// クレデンシャルによってアサートされたメールアドレスを持つアカウントがすでに存在する
  /// `fetchSignInMethodsForEmail` を呼び出して、返されたプロバイダの1つを使用してサインインするようにユーザーに依頼
  /// ユーザーがサインインすると、元のクレデンシャルを `linkWithCredential` でユーザーにリンクすることができる。
  static const accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';

  /// クレデンシャルが不正な形式であるか、有効期限が切れている
  static const invalidCredential = 'invalid-credential';

  /// 指定されたクレデンシャルに対応するユーザが無効になっている。
  static const userDisabled = 'user-disabled';

  /// Firebaseコンソールで対象のサインイン方法が有効になっていない。
  // static const operationNotAllowed = 'operation-not-allowed';

  /// Email認証の場合のみ。ユーザーが見つからない。
  // static const userNotFound = 'user-not-found';

  /// パスワードが脆弱
  // static const weakPassword = 'weak-password';

  /// Email認証の場合のみ。パスワードが間違っている、または設定されていない。
  // static const wrongPassword = 'wrong-password';

  /// 電話番号認証の場合のみ。検証コードが不正。
  // static const invalidVerificationCode = 'invalid-verification-code';

  /// 電話番号認証の場合のみ。検証コードが不正。
  // static const invalidVerificationId = 'invalid-verification-id';
}
