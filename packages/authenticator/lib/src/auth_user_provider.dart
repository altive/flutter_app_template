import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../authenticator.dart';

/// Return FirebaseAuth [User] as [AsyncValue]
final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

/// Return FirebaseAuth [User.uid] as [AsyncValue]
final uidProvider = Provider(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);

/// Return whether the [User] is a signed-in user or not as [AsyncValue]
final isSignedInProvider = FutureProvider(
  (ref) async {
    final user = await ref.watch(authUserProvider.future);
    return user != null;
  },
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
          (userInfo) => userInfo.providerId == SigningMethod.google.providerId,
        ) ??
        false;
  },
);

/// Returns whether Email of Google [User] or null.
final googleEmailProvider = Provider(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    final userInfo = user?.providerData.firstWhereOrNull(
      (userInfo) => userInfo.providerId == SigningMethod.google.providerId,
    );
    return userInfo?.email;
  },
);

/// Returns whether [User] is a user who is signed in to Apple or not.
final isAppleSignedInProvider = Provider(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    return user?.providerData.any(
          (userInfo) => userInfo.providerId == SigningMethod.apple.providerId,
        ) ??
        false;
  },
);

/// Returns whether [User] is a user who is signed in to Apple or not.
final appleEmailProvider = Provider(
  (ref) {
    final user = ref.watch(authUserProvider).value;
    final userInfo = user?.providerData.firstWhereOrNull(
      (userInfo) => userInfo.providerId == SigningMethod.apple.providerId,
    );
    return userInfo?.email;
  },
);
