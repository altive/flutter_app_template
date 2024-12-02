// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'package_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packageDetailsHash() => r'c08e0b016126b6b75a84b0addd1a8f87a6dc8fd4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for package details by package name.
///
/// Copied from [packageDetails].
@ProviderFor(packageDetails)
const packageDetailsProvider = PackageDetailsFamily();

/// Provider for package details by package name.
///
/// Copied from [packageDetails].
class PackageDetailsFamily extends Family<AsyncValue<GetPackageResponseBody>> {
  /// Provider for package details by package name.
  ///
  /// Copied from [packageDetails].
  const PackageDetailsFamily();

  /// Provider for package details by package name.
  ///
  /// Copied from [packageDetails].
  PackageDetailsProvider call({
    required String packageName,
  }) {
    return PackageDetailsProvider(
      packageName: packageName,
    );
  }

  @override
  PackageDetailsProvider getProviderOverride(
    covariant PackageDetailsProvider provider,
  ) {
    return call(
      packageName: provider.packageName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'packageDetailsProvider';
}

/// Provider for package details by package name.
///
/// Copied from [packageDetails].
class PackageDetailsProvider
    extends AutoDisposeFutureProvider<GetPackageResponseBody> {
  /// Provider for package details by package name.
  ///
  /// Copied from [packageDetails].
  PackageDetailsProvider({
    required String packageName,
  }) : this._internal(
          (ref) => packageDetails(
            ref as PackageDetailsRef,
            packageName: packageName,
          ),
          from: packageDetailsProvider,
          name: r'packageDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$packageDetailsHash,
          dependencies: PackageDetailsFamily._dependencies,
          allTransitiveDependencies:
              PackageDetailsFamily._allTransitiveDependencies,
          packageName: packageName,
        );

  PackageDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.packageName,
  }) : super.internal();

  final String packageName;

  @override
  Override overrideWith(
    FutureOr<GetPackageResponseBody> Function(PackageDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PackageDetailsProvider._internal(
        (ref) => create(ref as PackageDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        packageName: packageName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GetPackageResponseBody> createElement() {
    return _PackageDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PackageDetailsProvider && other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PackageDetailsRef
    on AutoDisposeFutureProviderRef<GetPackageResponseBody> {
  /// The parameter `packageName` of this provider.
  String get packageName;
}

class _PackageDetailsProviderElement
    extends AutoDisposeFutureProviderElement<GetPackageResponseBody>
    with PackageDetailsRef {
  _PackageDetailsProviderElement(super.provider);

  @override
  String get packageName => (origin as PackageDetailsProvider).packageName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
