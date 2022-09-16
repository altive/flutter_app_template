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

  /// 既にGoogleでサインイン済みなら`true`
  bool get alreadySigned => _auth.currentUser?.hasGoogleSigning ?? false;

  Future<UserCredential> signIn() async {
    final credential = await retrieveCredential();
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential;
  }

  Future<UserCredential> link() async {
    final user = _auth.currentUser!;
    final provider = GoogleAuthProvider();
    return user.linkWithProvider(provider);
  }

  /// Googleアカウントをリンク解除
  Future<User> unlink() async {
    final user = _auth.currentUser!;
    return user.unlink(SigningMethod.google.providerId);
  }

  Future<OAuthCredential> retrieveCredential() async {
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
}
