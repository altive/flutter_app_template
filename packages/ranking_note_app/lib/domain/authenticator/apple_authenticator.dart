import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'sign_in_method.dart';

export 'auth_user_provider.dart';

final appleAuthenticatorProvider = Provider<AppleAuthenticator>((ref) {
  return AppleAuthenticator(ref.read);
});

/// Sign in with Apple を許可するかどうか。
/// - iOS 13 and higher
/// - macOS 10.15 and higher
/// - (Android: Not implemented)
final canSignInWithAppleProvider = FutureProvider<bool>((ref) async {
  if (!await ref
      .watch(appleAuthenticatorProvider)
      .isSignInWithAppleAvailabled) {
    return false;
  }
  if (!Platform.isIOS && !Platform.isMacOS) {
    return false;
  }
  return true;
});

class AppleAuthenticator {
  AppleAuthenticator(this._read);

  // ignore: unused_field
  final Reader _read;

  Future<bool> get isSignInWithAppleAvailabled async =>
      SignInWithApple.isAvailable();

  /// Apple認証のクレデンシャルを要求する
  /// [SignInWithAppleException], [SignInWithAppleException]
  Future<AuthCredential?> requestAppleAuthCredential() async {
    if (!await isSignInWithAppleAvailabled) {
      throw Exception('Sign in with Apple に未対応の端末、もしくはOSです。');
    }
    // パッケージによる視覚情報のリクエスト実行
    /// Scope: [first name], [last name], [email] を指定可能
    /// Sign in with Apple が使えない場合、 [SignInWithAppleNotSupportedException]
    late AuthorizationCredentialAppleID credential;
    try {
      credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
      ]);
    } on SignInWithAppleAuthorizationException catch (e) {
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          // ユーザーによるキャンセル
          return null;
        case AuthorizationErrorCode.failed:
          rethrow;
        case AuthorizationErrorCode.invalidResponse:
          rethrow;
        case AuthorizationErrorCode.notHandled:
          rethrow;
        case AuthorizationErrorCode.unknown:
          rethrow;
        case AuthorizationErrorCode.notInteractive:
          rethrow;
      }
    }
    final credentialState =
        await SignInWithApple.getCredentialState(credential.userIdentifier!);

    switch (credentialState) {
      case CredentialState.authorized:
        // 成功！クレデンシャルを返却する
        final oAuthProvider = OAuthProvider(SignInMethod.apple.id);
        final oAuthCredential = oAuthProvider.credential(
          idToken: credential.identityToken,
          accessToken: credential.authorizationCode,
        );
        return oAuthCredential;

      case CredentialState.revoked:
        throw Exception('Sign in failed: Revoked');

      case CredentialState.notFound:
        throw Exception('Sign in failed: Not Found');
    }
  }
}
