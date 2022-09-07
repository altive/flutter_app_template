import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import 'apple_authenticator.dart';
import 'google_authenticator.dart';

final authenticatorProvider = Provider<Authenticator>((ref) {
  return Authenticator(
    appleAuthenticator: ref.watch(appleAuthenticatorProvider),
    googleAuthenticator: ref.watch(googleAuthenticatorProvider),
  );
});

class Authenticator {
  Authenticator({
    FirebaseAuth? auth,
    required AppleAuthenticator appleAuthenticator,
    required GoogleAuthenticator googleAuthenticator,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _appleAuth = appleAuthenticator,
        _googleAuth = googleAuthenticator;

  final FirebaseAuth _auth;
  final AppleAuthenticator _appleAuth;
  final GoogleAuthenticator _googleAuth;

  /// 匿名サインイン
  Future<UserCredential> signInAnonymously() async {
    final userCredential = await _auth.signInAnonymously();
    return userCredential;
  }

  /// Sign in with Apple
  /// `PlatformException`, [FirebaseAuthException], `SignInWithAppleException`,
  /// [Exception] が発生する可能性がある
  Future<UserCredential> signInWithApple() async {
    return _appleAuth.signIn();
  }

  /// Sign in with Google.
  /// `PlatformException`, [Exception] が発生する可能性がある
  Future<UserCredential> signInWithGoogle() async {
    return _googleAuth.signIn();
  }

  /// Link with Apple.
  Future<UserCredential> linkWithApple() async {
    return _appleAuth.link();
  }

  /// Link with Google.
  Future<UserCredential> linkWithGoogle() async {
    return _googleAuth.link();
  }

  /// Unlink from Apple.
  Future<void> unlinkFromApple() async {
    return _appleAuth.unlink();
  }

  /// Unlink from Google.
  Future<void> unlinkFromGoogle() async {
    return _googleAuth.unlink();
  }

  /// サインアウト
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// アカウントを削除する
  /// [FirebaseAuthException], [Exception] が発生する可能性がある
  Future<void> deleteAccount() async {
    //   final user = _auth.currentUser!;
    //   try {
    //     // アカウントを削除実行
    //     await user.delete();
    //   } on FirebaseAuthException catch (exception) {
    //     switch (exception.code) {
    //       case AuthErrorCode.requiresRecentLogin:
    //         // 再認証が必要なことを示す例外
    //         await _reauthenticate();
    //         // 再度、アカウント削除を実行
    //         await user.delete();
    //         break;
    //       default:
    //         // 再認証必須以外の認証例外
    //         rethrow;
    //     }
    //   }
  }

  /// 再認証を実施する
  // Future<UserCredential> _reauthenticate() async {
  //   final user = _user!;

  //   // 匿名認証ユーザーの場合
  //   if (_isAnonymousSignedIn) {
  //     return FirebaseAuth.instance.signInAnonymously();
  //   }

  //   AuthCredential? authCredential;

  //   if (_isGoogleSignedIn) {
  //     // Google連携済みの場合
  //     authCredential = await _googleAuth.requestGoogleAuthCredential();
  //   } else if (_isAppleSignedIn) {
  //     // Apple連携済みの場合
  //     authCredential = await _appleAuth.requestAppleAuthCredential();
  //   }
  //   return user.reauthenticateWithCredential(authCredential!);
  // }
}
