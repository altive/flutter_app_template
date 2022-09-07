import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

import '../authenticator.dart';

export 'auth_user_provider.dart';

final googleAuthenticatorProvider = Provider<GoogleAuthenticator>((ref) {
  return GoogleAuthenticator(ref.watch(firebaseAuthProvider));
});

class GoogleAuthenticator {
  GoogleAuthenticator(this._auth);

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signIn() async {
    final credential = await _retrieveCredential();
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential;
  }

  Future<UserCredential> link() async {
    final currentUser = _auth.currentUser!;
    final credential = await _retrieveCredential();
    final userCredential = await currentUser.linkWithCredential(credential);
    return userCredential;
  }

  Future<OAuthCredential> _retrieveCredential() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(code: 'cancel');
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return credential;
  }

  /// Googleアカウントをリンク解除
  Future<void> unlink() async {
    final user = _auth.currentUser!;
    try {
      await user.unlink(SigningMethod.google.providerId);
    } on FirebaseAuthException catch (_) {
      // switch (exception.code) {
      //   case FirebaseAuthExceptionCode.requiresRecentLogin:
      //     // 再認証が必要なことを示す例外
      //     await _reauthenticate();
      //     // 再度、リンク解除を実行
      //     await user.unlink(SigningMethod.google.providerId);
      //   default:
      //     // 再認証必須以外の認証例外
      //     rethrow;
      // }
    }
  }
}
