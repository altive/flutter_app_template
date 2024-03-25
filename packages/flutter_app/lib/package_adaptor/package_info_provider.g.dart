// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'package_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packageInfoInitializingHash() =>
    r'f08f031b27189f382d00702ba98adab4f82b944a';

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

typedef PackageInfoInitializingRef = FutureProviderRef<PackageInfo>;
String _$packageInfoHash() => r'9b711fe79c9d46a81ff455a72adb29031fc2cad5';

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

typedef PackageInfoRef = ProviderRef<PackageInfo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
