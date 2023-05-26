import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../authenticator.dart';

part 'auth_user_provider.g.dart';

/// Return FirebaseAuth [User] as [AsyncValue]
@Riverpod(keepAlive: true)
Stream<User?> authUser(AuthUserRef ref) {
  return ref.watch(firebaseAuthProvider).userChanges();
}

/// Return FirebaseAuth [User.uid] as [AsyncValue]
@Riverpod(keepAlive: true)
Future<String?> uid(UidRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  return user?.uid;
}

/// Return whether the [User] is a signed-in user or not as [AsyncValue]
@Riverpod(keepAlive: true)
Future<bool> isSignedIn(IsSignedInRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  return user != null;
}

/// Returns whether or not [User] is an anonymous authenticated user.
@Riverpod(keepAlive: true)
Future<bool> isAnonymousSignedIn(IsAnonymousSignedInRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  return user?.providerData.isEmpty ?? false;
}

/// Returns whether [User] is a user who is signed in to Google or not.
@Riverpod(keepAlive: true)
Future<bool> isGoogleSignedIn(IsGoogleSignedInRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  return user?.providerData.any(
        (userInfo) => userInfo.providerId == SigningMethod.google.providerId,
      ) ??
      false;
}

/// Returns whether Email of Google [User] or null.
@Riverpod(keepAlive: true)
Future<String?> googleEmail(GoogleEmailRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  final userInfo = user?.providerData.firstWhereOrNull(
    (userInfo) => userInfo.providerId == SigningMethod.google.providerId,
  );
  return userInfo?.email;
}

/// Returns whether [User] is a user who is signed in to Apple or not.
@Riverpod(keepAlive: true)
Future<bool> isAppleSignedIn(IsAppleSignedInRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  return user?.providerData.any(
        (userInfo) => userInfo.providerId == SigningMethod.apple.providerId,
      ) ??
      false;
}

/// Returns whether [User] is a user who is signed in to Apple or not.
@Riverpod(keepAlive: true)
Future<String?> appleEmail(AppleEmailRef ref) async {
  final user = await ref.watch(authUserProvider.future);
  final userInfo = user?.providerData.firstWhereOrNull(
    (userInfo) => userInfo.providerId == SigningMethod.apple.providerId,
  );
  return userInfo?.email;
}
