import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commons/providers/firebase_auth_provider.dart';
import 'apple_authenticator.dart';
import 'auth_error_code.dart';
import 'google_authenticator.dart';
import 'sign_in_method.dart';

export 'auth_user_provider.dart';

final authenticatorProvider = Provider<Authenticator>((ref) {
  return Authenticator(ref.read);
});

class Authenticator {
  Authenticator(this._read);

  final Reader _read;
  late final _auth = _read(firebaseAuthProvider);
  User? get _user => _read(authUserProvider).value;
  bool get _isAnonymousSinedIn => _read(isAnonymousSignedInProvider);
  bool get _isGoogleSinedIn => _read(isGoogleSignedInProvider);
  bool get _isAppleSinedIn => _read(isAppleSignedInProvider);
  AppleAuthenticator get _appleAuth => _read(appleAuthenticatorProvider);
  GoogleAuthenticator get _googleAuth => _read(googleAuthenticatorProvider);

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  /// Sign in with Apple
  /// [PlatformException], [FirebaseAuthException], `SignInWithAppleException`,
  /// [Exception] が発生する可能性がある
  Future<UserCredential?> signInWithApple() async {
    final authCredential = await _appleAuth.requestAppleAuthCredential();
    if (authCredential == null) {
      // ユーザーによるキャンセル
      return null;
    }
    final userCredential = await _signInWithAuthCredential(authCredential);
    // ユーザー更新
    return userCredential;
  }

  /// Sign in with Google.
  /// [PlatformException], [Exception] が発生する可能性がある
  Future<UserCredential?> signInWithGoogle() async {
    final authCredential = await _googleAuth.requestGoogleAuthCredential();
    if (authCredential == null) {
      // ユーザーによるキャンセル
      return null;
    }
    final userCredential = await _signInWithAuthCredential(authCredential);
    return userCredential;
  }

  /// Apple IDをリンクする
  ///
  /// AuthCredentialをリクエストしたときに[PlatformException], [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  /// 連携成功で`true`キャンセルの場合は`false`を返却する
  Future<bool> linkAppleAccount() async {
    // 必ず認証済みの状態で使用される。
    final user = _user!;
    // クレデンシャルを取得
    final authCredential = await _appleAuth.requestAppleAuthCredential();
    if (authCredential == null) {
      // ユーザーキャンセル
      return false;
    }
    // 認証連携を実行
    try {
      await user.linkWithCredential(authCredential);
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、認証連携を実行
          await user.linkWithCredential(authCredential);
          return true;
        default:
          // 再認証必須以外の認証例外
          rethrow;
      }
    }
  }

  /// Apple IDをリンク解除
  ///
  /// AuthCredentialをリクエストしたときに[PlatformException], [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  /// 連携成功で`true`キャンセルの場合は`false`を返却する
  Future<bool> unlinkAppleAccount() async {
    // 必ず認証済みの状態で使用される。
    final user = _user!;
    try {
      await user.unlink(SignInMethod.apple.id);
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、リンク解除を実行
          await user.unlink(SignInMethod.apple.id);
          return true;
        default:
          // 再認証必須以外の認証例外
          rethrow;
      }
    }
  }

  /// Googleアカウントをリンクする
  ///
  /// AuthCredentialをリクエストしたときに [PlatformException] , [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  Future<bool> linkGoogleAccount() async {
    // 必ず認証済みの状態で使用される。
    final user = _user!;
    // クレデンシャルを取得
    final authCredential = await _googleAuth.requestGoogleAuthCredential();
    if (authCredential == null) {
      // ユーザーキャンセル
      return false;
    }
    // 認証連携を実行
    try {
      await user.linkWithCredential(authCredential);
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、認証連携を実行
          await user.linkWithCredential(authCredential);
          return true;
        default:
          // 再認証必須以外の認証例外
          rethrow;
      }
    }
  }

  /// Googleアカウントをリンク解除
  ///
  /// AuthCredentialをリクエストしたときに [PlatformException] , [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  Future<bool> unlinkGoogleAccount() async {
    // 必ず認証状態である。
    final user = _user!;
    try {
      await user.unlink(SignInMethod.google.id);
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、リンク解除を実行
          await user.unlink(SignInMethod.google.id);
          return true;
        default:
          // 再認証必須以外の認証例外
          rethrow;
      }
    }
  }

  /// アカウントからサインアウトし、匿名アカウントとなる。
  /// `authStateChanges`、`idTokenChanges`、`userChanges`のリスナーも更新される。
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// アカウントを削除する
  /// [FirebaseAuthException], [Exception] が発生する可能性がある
  Future<void> deleteAccount() async {
    // 必ず認証状態である。
    final user = _user!;
    try {
      // アカウントを削除実行
      await user.delete();
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、アカウント削除を実行
          await user.delete();
          break;
        default:
          // 再認証必須以外の認証例外
          rethrow;
      }
    }
  }

  /// 認証で得たCredentialを使ってサインインし、取得できたフルネームがあれば反映する
  /// [FirebaseAuthException], [Exception] が発生する可能性がある
  Future<UserCredential> _signInWithAuthCredential(
    AuthCredential authCredential,
  ) async {
    final userCredential = await _auth.signInWithCredential(authCredential);
    return userCredential;
  }

  // 再認証を実施する
  Future<UserCredential> _reauthenticate() async {
    final user = _user!;

    // 匿名認証ユーザーの場合
    if (_isAnonymousSinedIn) {
      return FirebaseAuth.instance.signInAnonymously();
    }

    AuthCredential? authCredential;

    if (_isGoogleSinedIn) {
      // Google連携済みの場合
      authCredential = await _googleAuth.requestGoogleAuthCredential();
    } else if (_isAppleSinedIn) {
      // Apple連携済みの場合
      authCredential = await _appleAuth.requestAppleAuthCredential();
    }
    return user.reauthenticateWithCredential(authCredential!);
  }
}
