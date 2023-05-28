// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserHash() => r'6f0e4a44f304de7a7e2ed13cb48193e9667fef8b';

/// Return FirebaseAuth [User] as [AsyncValue]
///
/// Copied from [authUser].
@ProviderFor(authUser)
final authUserProvider = StreamProvider<User?>.internal(
  authUser,
  name: r'authUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthUserRef = StreamProviderRef<User?>;
String _$uidHash() => r'753aa02f570d5cbcf7fadce7a9142347d3a38dca';

/// Return FirebaseAuth [User.uid] as [AsyncValue]
///
/// Copied from [uid].
@ProviderFor(uid)
final uidProvider = FutureProvider<String?>.internal(
  uid,
  name: r'uidProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$uidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UidRef = FutureProviderRef<String?>;
String _$isSignedInHash() => r'1ec956149e15e61fa827aaa442d406c1f12b85e8';

/// Return whether the [User] is a signed-in user or not as [AsyncValue]
///
/// Copied from [isSignedIn].
@ProviderFor(isSignedIn)
final isSignedInProvider = FutureProvider<bool>.internal(
  isSignedIn,
  name: r'isSignedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsSignedInRef = FutureProviderRef<bool>;
String _$isAnonymousSignedInHash() =>
    r'adaa6e9fd0b95d8adab8dea3a174b89df936b500';

/// Returns whether or not [User] is an anonymous authenticated user.
///
/// Copied from [isAnonymousSignedIn].
@ProviderFor(isAnonymousSignedIn)
final isAnonymousSignedInProvider = FutureProvider<bool>.internal(
  isAnonymousSignedIn,
  name: r'isAnonymousSignedInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAnonymousSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAnonymousSignedInRef = FutureProviderRef<bool>;
String _$isGoogleSignedInHash() => r'9dcfcdfad669f25342966a523ba3e17bcf536342';

/// Returns whether [User] is a user who is signed in to Google or not.
///
/// Copied from [isGoogleSignedIn].
@ProviderFor(isGoogleSignedIn)
final isGoogleSignedInProvider = FutureProvider<bool>.internal(
  isGoogleSignedIn,
  name: r'isGoogleSignedInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isGoogleSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsGoogleSignedInRef = FutureProviderRef<bool>;
String _$googleEmailHash() => r'd527c72b761b6a99d5262640012ca278fb19bf8d';

/// Returns whether Email of Google [User] or null.
///
/// Copied from [googleEmail].
@ProviderFor(googleEmail)
final googleEmailProvider = FutureProvider<String?>.internal(
  googleEmail,
  name: r'googleEmailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$googleEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoogleEmailRef = FutureProviderRef<String?>;
String _$isAppleSignedInHash() => r'faeecf91fc2b5a46ed098d18cf2207b13cb51424';

/// Returns whether [User] is a user who is signed in to Apple or not.
///
/// Copied from [isAppleSignedIn].
@ProviderFor(isAppleSignedIn)
final isAppleSignedInProvider = FutureProvider<bool>.internal(
  isAppleSignedIn,
  name: r'isAppleSignedInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAppleSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAppleSignedInRef = FutureProviderRef<bool>;
String _$appleEmailHash() => r'75a619f757c8e2440e1475bfce83023e59188567';

/// Returns whether [User] is a user who is signed in to Apple or not.
///
/// Copied from [appleEmail].
@ProviderFor(appleEmail)
final appleEmailProvider = FutureProvider<String?>.internal(
  appleEmail,
  name: r'appleEmailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appleEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppleEmailRef = FutureProviderRef<String?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
