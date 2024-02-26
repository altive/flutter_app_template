// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'authenticator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticatorHash() => r'6925c886cb4003fcd1a57aa84d0f353279d6594a';

/// `[altfire_authenticator]` パッケージの [Authenticator] クラスインスタンスを提供する。
///
/// Copied from [authenticator].
@ProviderFor(authenticator)
final authenticatorProvider = Provider<Authenticator>.internal(
  authenticator,
  name: r'authenticatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticatorRef = ProviderRef<Authenticator>;
String _$userHash() => r'2a5c88c5ec8c1a3eacb778b712f7c7b3b1a9f785';

/// Firebase Authの[User]情報を提供する。
///
/// Copied from [user].
@ProviderFor(user)
final userProvider = AutoDisposeStreamProvider<User?>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRef = AutoDisposeStreamProviderRef<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
