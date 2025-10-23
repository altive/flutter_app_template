import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authenticatable.dart';
import 'signing_method.dart';
import 'user_extension.dart';

/// GoogleAuthenticator is a class that implements the Authenticatable interface
/// to provide authentication using Google Sign-In with Firebase.
///
/// This class handles the authentication process for Google Sign-In, including
/// signing in, re-authenticating, linking, and unlinking the Google provider.
///
/// It uses the FirebaseAuth instance to perform authentication operations.
///
/// Example usage:
/// ```dart
/// final googleAuthenticator = GoogleAuthenticator(FirebaseAuth.instance);
/// final userCredential = await googleAuthenticator.signIn();
/// ```
class GoogleAuthenticator implements Authenticatable {
  /// Creates a new instance of GoogleAuthenticator with
  GoogleAuthenticator(this._auth);

  final FirebaseAuth _auth;

  final _googleSignIn = GoogleSignIn();

  User get _user => _auth.currentUser!;

  @override
  bool get alreadySigned => _auth.currentUser?.hasGoogleSigning ?? false;

  @override
  Future<UserCredential> signIn([AuthCredential? credential]) async {
    credential ??= await _retrieveCredential();
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential;
  }

  @override
  Future<UserCredential> reauthenticate([AuthCredential? credential]) async {
    credential ??= await _retrieveCredential();
    return _user.reauthenticateWithCredential(credential);
  }

  @override
  Future<UserCredential> link([AuthCredential? credential]) async {
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
