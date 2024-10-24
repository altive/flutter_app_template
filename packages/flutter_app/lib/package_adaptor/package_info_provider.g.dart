// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'package_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packageInfoInitializingHash() =>
    r'92258b1cb5e798dac5f0ee4dadb2a05b2bc9c6a9';

/// Providers that need to initialize asynchronously only once at startup.
///
/// Copied from [packageInfoInitializing].
@ProviderFor(packageInfoInitializing)
final packageInfoInitializingProvider = FutureProvider<PackageInfo>.internal(
  packageInfoInitializing,
  name: r'packageInfoInitializingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$packageInfoInitializingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PackageInfoInitializingRef = FutureProviderRef<PackageInfo>;
String _$packageInfoHash() => r'96addbd397773a31f7584c089d1540ad59e2f05f';

/// Provide metadata for the application.
///
/// After initialization, use this, which can be obtained synchronously.
///
/// Copied from [packageInfo].
@ProviderFor(packageInfo)
final packageInfoProvider = Provider<PackageInfo>.internal(
  packageInfo,
  name: r'packageInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$packageInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PackageInfoRef = ProviderRef<PackageInfo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
