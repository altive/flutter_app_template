import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../authenticator.dart';
import 'authenticatable.dart';

export 'auth_user_provider.dart';

part 'google_authenticator.g.dart';

@Riverpod(keepAlive: true)
GoogleAuthenticator googleAuthenticator(GoogleAuthenticatorRef ref) {
  return GoogleAuthenticator(ref.watch(firebaseAuthProvider));
}

class GoogleAuthenticator implements Authenticatable {
  GoogleAuthenticator(this._auth);

  final FirebaseAuth _auth;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User get _user => _auth.currentUser!;

  @override
  bool get alreadySigned => _auth.currentUser?.hasGoogleSigning ?? false;

  @override
  Future<UserCredential> signIn() async {
    final credential = await _retrieveCredential();
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential;
  }

  @override
  Future<UserCredential> reauthenticate() async {
    final credential = await _retrieveCredential();
    return _user.reauthenticateWithCredential(credential);
  }

  @override
  Future<UserCredential> link() async {
    final provider = GoogleAuthProvider();
    return _user.linkWithProvider(provider);
  }

  @override
  Future<User> unlink() async {
    return _user.unlink(SigningMethod.google.providerId);
  }

  Future<OAuthCredential> _retrieveCredential() async {
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) {
      throw FirebaseAuthException(code: 'cancel');
    }
    final googleAuth = await googleAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return credential;
  }
}
