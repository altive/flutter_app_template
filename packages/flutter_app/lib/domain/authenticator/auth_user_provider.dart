import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commons/providers/firebase_auth_provider.dart';
import 'sign_in_method.dart';

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

/// Returns whether or not [User] is an anonymous authenticated user.
final isAnonymousSignedInProvider = Provider(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    return user?.providerData.isEmpty ?? false;
  },
);

/// Returns whether [User] is a user who is signed in to Google or not.
final isGoogleSignedInProvider = Provider(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    return user?.providerData.any(
          (userInfo) => userInfo.providerId == SignInMethod.google.providerId,
        ) ??
        false;
  },
);

/// Returns whether [User] is a user who is signed in to Apple or not.
final isAppleSignedInProvider = Provider(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    return user?.providerData.any(
          (userInfo) => userInfo.providerId == SignInMethod.apple.providerId,
        ) ??
        false;
  },
);
