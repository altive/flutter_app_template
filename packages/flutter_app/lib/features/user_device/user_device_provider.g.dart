// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDeviceInitializingHash() =>
    r'1b0e65e751825dd88e0cbab163f8b7eb288dd80e';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserDeviceInitializingRef = FutureProviderRef<UserDevice>;
String _$userDeviceHash() => r'6a8bfaca921762b489dae3d6f9b6363bfcab16f2';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserDeviceRef = ProviderRef<UserDevice>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
