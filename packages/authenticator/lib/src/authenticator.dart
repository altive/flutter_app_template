import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'apple_authenticator.dart';
import 'firebase_auth_exception_code.dart';
import 'google_authenticator.dart';

part 'authenticator.g.dart';

@Riverpod(keepAlive: true)
Authenticator authenticator(AuthenticatorRef ref) {
  return Authenticator(
    appleAuthenticator: ref.watch(appleAuthenticatorProvider),
    googleAuthenticator: ref.watch(googleAuthenticatorProvider),
  );
}

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

  User get _user => _auth.currentUser!;

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
  Future<User> unlinkFromApple() async {
    return _appleAuth.unlink();
  }

  /// Unlink from Google.
  Future<User> unlinkFromGoogle() async {
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
  Future<void> deleteAccount() async {
    try {
      // アカウントを削除実行
      await _user.delete();
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case FirebaseAuthExceptionCode.requiresRecentLogin:
          // 再認証の後、再度実行する
          await _reauthenticate();
          await _user.delete();
        default:
          // 再認証必須以外の例外はRethrowする
          rethrow;
      }
    }
  }

  /// 再認証を実施する
  Future<UserCredential> _reauthenticate() async {
    if (_googleAuth.alreadySigned) {
      return _googleAuth.reauthenticate();
    } else if (_appleAuth.alreadySigned) {
      return _appleAuth.reauthenticate();
    } else {
      throw UnimplementedError('未対応のSigningMethodがあります。');
    }
  }
}
