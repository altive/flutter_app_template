import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import '../authenticator.dart';

final appleAuthenticatorProvider = Provider<AppleAuthenticator>((ref) {
  return AppleAuthenticator(ref.watch(firebaseAuthProvider));
});

class AppleAuthenticator {
  AppleAuthenticator(this._auth);

  final FirebaseAuth _auth;

  Future<UserCredential> signIn() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      return _auth.signInWithPopup(appleProvider);
    } else {
      return _auth.signInWithAuthProvider(appleProvider);
    }
  }

  Future<UserCredential> link() async {
    final user = _auth.currentUser!;
    final token = await user.getIdToken();
    final credential = AppleAuthProvider.credential(token);
    return user.linkWithCredential(credential);
  }

  /// Apple IDをリンク解除
  ///
  /// AuthCredentialをリクエストしたときに`PlatformException`, [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  /// 連携成功で`true`キャンセルの場合は`false`を返却する
  Future<void> unlink() async {
    // final user = _auth.currentUser!;
    // try {
    //   await user.unlink(SigningMethod.apple.providerId);
    //   return true;
    // } on FirebaseAuthException catch (exception) {
    //   switch (exception.code) {
    //     case AuthErrorCode.requiresRecentLogin:
    //       // 再認証が必要なことを示す例外
    //       await _reauthenticate();
    //       // 再度、リンク解除を実行
    //       await user.unlink(SigningMethod.apple.providerId);
    //       return true;
    //     default:
    //       // 再認証必須以外の認証例外
    //       rethrow;
    //   }
    // }
  }
}
