import 'package:authenticator/authenticator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provides an instance of the [Authenticator] class
/// from the `[altfire_authenticator]` package.
final authenticatorProvider = Provider<Authenticator>((ref) {
  return Authenticator();
});

/// Provides [User] information from Firebase Auth.
final StreamProvider<User?> userProvider = StreamProvider.autoDispose<User?>(
  (ref) => ref.watch(authenticatorProvider).userChanges,
);
