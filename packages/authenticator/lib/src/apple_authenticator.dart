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

  /// 既にAppleでサインイン済みなら`true`
  bool get alreadySigned => _auth.currentUser?.hasAppleSigning ?? false;

  Future<UserCredential> signIn() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      final userCredential = await _auth.signInWithPopup(appleProvider);
      return userCredential;
    } else {
      final userCredential = await _auth.signInWithAuthProvider(appleProvider);
      return userCredential;
    }
  }

  Future<UserCredential> link() async {
    final user = _auth.currentUser!;
    final userCredential = await signIn();
    return user.linkWithCredential(userCredential.credential!);
  }

  /// Apple IDをリンク解除
  Future<User> unlink() async {
    final user = _auth.currentUser!;
    return user.unlink(SigningMethod.apple.providerId);
  }
}
