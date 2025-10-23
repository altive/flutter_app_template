import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'authenticatable.dart';
import 'signing_method.dart';
import 'user_extension.dart';

/// AppleAuthenticator is a class that implements the Authenticatable interface
/// to provide authentication using Apple Sign-In with Firebase.
///
/// This class handles the authentication process for Apple Sign-In, including
/// signing in, re-authenticating, linking, and unlinking the Apple provider.
///
/// It uses the FirebaseAuth instance to perform authentication operations.
///
/// Example usage:
/// ```dart
/// final appleAuthenticator = AppleAuthenticator(FirebaseAuth.instance);
/// final userCredential = await appleAuthenticator.signIn();
/// ```
class AppleAuthenticator implements Authenticatable {
  /// Creates a new instance of AppleAuthenticator with
  /// the provided FirebaseAuth instance.
  AppleAuthenticator(this._auth);

  final FirebaseAuth _auth;

  final _authProvider = AppleAuthProvider();

  User get _user => _auth.currentUser!;

  @override
  bool get alreadySigned => _auth.currentUser?.hasAppleSigning ?? false;

  @override
  Future<UserCredential> signIn([AuthCredential? credential]) async {
    if (kIsWeb) {
      final userCredential = await _auth.signInWithPopup(_authProvider);
      return userCredential;
    } else {
      final userCredential = await _auth.signInWithProvider(_authProvider);
      return userCredential;
    }
  }

  @override
  Future<UserCredential> reauthenticate([AuthCredential? credential]) async {
    return _auth.currentUser!.reauthenticateWithProvider(_authProvider);
  }

  @override
  Future<UserCredential> link([AuthCredential? credential]) async {
    return _user.linkWithProvider(_authProvider);
  }

  @override
  Future<User> unlink() async {
    return _user.unlink(SigningMethod.apple.providerId);
  }
}
