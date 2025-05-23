// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'configurator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configuratorHash() => r'9e492ffb951b15cbe24c846fb5bdcbb0fe71a690';

/// Provides a [Configurator] to retrieve parameters using "RemoteConfig".
///
/// It is recommended to call [Configurator.fetchAndActivate] before using
/// the parameters (e.g., at app startup) in order to fetch and activate them
/// for use in the app.
///
/// Copied from [configurator].
@ProviderFor(configurator)
final configuratorProvider = Provider<Configurator>.internal(
  configurator,
  name: r'configuratorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuratorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfiguratorRef = ProviderRef<Configurator>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
