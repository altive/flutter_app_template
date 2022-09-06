import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Authenticator {
  Authenticator({
    FirebaseAuth? auth,
  }) : _auth = auth ?? FirebaseAuth.instance;

  final FirebaseAuth _auth;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
