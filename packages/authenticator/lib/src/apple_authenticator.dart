import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../authenticator.dart';
import 'authenticatable.dart';

part 'apple_authenticator.g.dart';

@Riverpod(keepAlive: true)
AppleAuthenticator appleAuthenticator(AppleAuthenticatorRef ref) {
  return AppleAuthenticator(ref.watch(firebaseAuthProvider));
}

class AppleAuthenticator implements Authenticatable {
  AppleAuthenticator(this._auth);

  final FirebaseAuth _auth;

  final authProvider = AppleAuthProvider();

  User get _user => _auth.currentUser!;

  /// 既にAppleでサインイン済みなら`true`
  @override
  bool get alreadySigned => _auth.currentUser?.hasAppleSigning ?? false;

  @override
  Future<UserCredential> signIn() async {
    if (kIsWeb) {
      final userCredential = await _auth.signInWithPopup(authProvider);
      return userCredential;
    } else {
      final userCredential = await _auth.signInWithProvider(authProvider);
      return userCredential;
    }
  }

  @override
  Future<UserCredential> reauthenticate() async {
    return _auth.currentUser!.reauthenticateWithProvider(authProvider);
  }

  @override
  Future<UserCredential> link() async {
    return _user.linkWithProvider(authProvider);
  }

  @override
  Future<User> unlink() async {
    return _user.unlink(SigningMethod.apple.providerId);
  }
}
