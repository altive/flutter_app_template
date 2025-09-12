import 'package:altfire_authenticator/altfire_authenticator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// `[altfire_authenticator]` パッケージの [Authenticator] クラスインスタンスを提供する。
final authenticatorProvider = Provider<Authenticator>((ref) {
  return Authenticator();
});

/// Firebase Authの[User]情報を提供する。
final StreamProvider<User?> userProvider = StreamProvider.autoDispose<User?>(
  (ref) => ref.watch(authenticatorProvider).userChanges,
);
