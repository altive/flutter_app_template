import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commons/providers/firebase_auth_provider.dart';

export 'auth_user_provider.dart';
export 'sign_in_method.dart';

final authenticatorProvider = Provider<Authenticator>((ref) {
  return Authenticator(ref.read);
});

class Authenticator {
  Authenticator(this._read);

  final Reader _read;
  FirebaseAuth get _firebaseAuth => _read(firebaseAuthProvider);

  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
