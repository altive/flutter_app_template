import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commons/providers/firebase_auth_provider.dart';

/// Return FirebaseAuth [User] as [AsyncValue]
final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

/// Return FirebaseAuth [User.uid] as [AsyncValue]
final uidProvider = Provider(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);

/// Return whether the [User] is a signed-in user or not as [AsyncValue]
final isSignedInProvider = Provider(
  (ref) => ref.watch(authUserProvider).whenData((user) => user != null),
);
