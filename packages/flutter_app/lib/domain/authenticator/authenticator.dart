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
  late final _firebaseAuth = _read(firebaseAuthProvider);

  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }
}
