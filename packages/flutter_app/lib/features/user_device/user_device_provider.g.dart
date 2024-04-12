// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDeviceInitializingHash() =>
    r'3237e34d761a616b6a5882669c482576078688f7';

/// Providers that need to initialize asynchronously only once at startup.
///
/// Copied from [userDeviceInitializing].
@ProviderFor(userDeviceInitializing)
final userDeviceInitializingProvider = FutureProvider<UserDevice>.internal(
  userDeviceInitializing,
  name: r'userDeviceInitializingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDeviceInitializingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDeviceInitializingRef = FutureProviderRef<UserDevice>;
String _$userDeviceHash() => r'57235a07f31ad84acdc0fa417c8b103223c27e0e';

/// Provide information on devices used by users.
///
/// After initialization, use this, which can be obtained synchronously.
///
/// Copied from [userDevice].
@ProviderFor(userDevice)
final userDeviceProvider = Provider<UserDevice>.internal(
  userDevice,
  name: r'userDeviceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDeviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDeviceRef = ProviderRef<UserDevice>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
