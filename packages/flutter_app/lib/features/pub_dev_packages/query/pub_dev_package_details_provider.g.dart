// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'pub_dev_package_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pubDevPackageDetailsHash() =>
    r'009b9b652b9792197a424bd7825542bdcae202a6';

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

/// Provider for pub.dev package details by package name.
///
/// Copied from [pubDevPackageDetails].
@ProviderFor(pubDevPackageDetails)
const pubDevPackageDetailsProvider = PubDevPackageDetailsFamily();

/// Provider for pub.dev package details by package name.
///
/// Copied from [pubDevPackageDetails].
class PubDevPackageDetailsFamily
    extends Family<AsyncValue<GetPackageDetailsResponseBody>> {
  /// Provider for pub.dev package details by package name.
  ///
  /// Copied from [pubDevPackageDetails].
  const PubDevPackageDetailsFamily();

  /// Provider for pub.dev package details by package name.
  ///
  /// Copied from [pubDevPackageDetails].
  PubDevPackageDetailsProvider call({required String packageName}) {
    return PubDevPackageDetailsProvider(packageName: packageName);
  }

  @override
  PubDevPackageDetailsProvider getProviderOverride(
    covariant PubDevPackageDetailsProvider provider,
  ) {
    return call(packageName: provider.packageName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pubDevPackageDetailsProvider';
}

/// Provider for pub.dev package details by package name.
///
/// Copied from [pubDevPackageDetails].
class PubDevPackageDetailsProvider
    extends AutoDisposeFutureProvider<GetPackageDetailsResponseBody> {
  /// Provider for pub.dev package details by package name.
  ///
  /// Copied from [pubDevPackageDetails].
  PubDevPackageDetailsProvider({required String packageName})
    : this._internal(
        (ref) => pubDevPackageDetails(
          ref as PubDevPackageDetailsRef,
          packageName: packageName,
        ),
        from: pubDevPackageDetailsProvider,
        name: r'pubDevPackageDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pubDevPackageDetailsHash,
        dependencies: PubDevPackageDetailsFamily._dependencies,
        allTransitiveDependencies:
            PubDevPackageDetailsFamily._allTransitiveDependencies,
        packageName: packageName,
      );

  PubDevPackageDetailsProvider._internal(
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
    FutureOr<GetPackageDetailsResponseBody> Function(
      PubDevPackageDetailsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PubDevPackageDetailsProvider._internal(
        (ref) => create(ref as PubDevPackageDetailsRef),
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
  AutoDisposeFutureProviderElement<GetPackageDetailsResponseBody>
  createElement() {
    return _PubDevPackageDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PubDevPackageDetailsProvider &&
        other.packageName == packageName;
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
mixin PubDevPackageDetailsRef
    on AutoDisposeFutureProviderRef<GetPackageDetailsResponseBody> {
  /// The parameter `packageName` of this provider.
  String get packageName;
}

class _PubDevPackageDetailsProviderElement
    extends AutoDisposeFutureProviderElement<GetPackageDetailsResponseBody>
    with PubDevPackageDetailsRef {
  _PubDevPackageDetailsProviderElement(super.provider);

  @override
  String get packageName =>
      (origin as PubDevPackageDetailsProvider).packageName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
