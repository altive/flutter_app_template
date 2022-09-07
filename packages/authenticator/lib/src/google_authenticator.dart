import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import '../authenticator.dart';

export 'auth_user_provider.dart';

final googleAuthenticatorProvider = Provider<GoogleAuthenticator>((ref) {
  return GoogleAuthenticator(ref.watch(firebaseAuthProvider));
});

class GoogleAuthenticator {
  GoogleAuthenticator(this._auth);

  final FirebaseAuth _auth;

  Future<UserCredential> signIn() async {
    final provider = GoogleAuthProvider();
    if (kIsWeb) {
      return _auth.signInWithPopup(provider);
    } else {
      return _auth.signInWithAuthProvider(provider);
    }
  }

  Future<UserCredential> link() async {
    final user = _auth.currentUser!;
    final token = await user.getIdToken();
    final credential = GoogleAuthProvider.credential(idToken: token);
    return user.linkWithCredential(credential);
  }

  /// Googleアカウントをリンク解除
  ///
  /// AuthCredentialをリクエストしたときに `PlatformException` , [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  Future<void> unlink() async {
    // final user = _auth.currentUser!;
    // try {
    //   await user.unlink(SignInMethod.google.id);
    //   return true;
    // } on FirebaseAuthException catch (exception) {
    //   switch (exception.code) {
    //     case AuthErrorCode.requiresRecentLogin:
    //       // 再認証が必要なことを示す例外
    //       await _reauthenticate();
    //       // 再度、リンク解除を実行
    //       await user.unlink(SignInMethod.google.id);
    //       return true;
    //     default:
    //       // 再認証必須以外の認証例外
    //       rethrow;
    //   }
    // }
  }
}
