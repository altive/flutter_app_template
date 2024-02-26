import 'package:altfire_authenticator/altfire_authenticator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authenticator_provider.g.dart';

/// `[altfire_authenticator]` パッケージの [Authenticator] クラスインスタンスを提供する。
@Riverpod(keepAlive: true)
Authenticator authenticator(AuthenticatorRef ref) {
  return Authenticator();
}

/// Firebase Authの[User]情報を提供する。
@riverpod
Stream<User?> user(UserRef ref) {
  return ref.watch(authenticatorProvider).userChanges;
}
