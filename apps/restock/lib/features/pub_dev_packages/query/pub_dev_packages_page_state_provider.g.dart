// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'pub_dev_packages_page_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pubDevPackageSearchWordStateHash() =>
    r'4503635ef8a15e7279a81f805139a09dbafd0320';

/// Provider for the search word of pub.dev packages.
///
/// Copied from [PubDevPackageSearchWordState].
@ProviderFor(PubDevPackageSearchWordState)
final pubDevPackageSearchWordStateProvider =
    NotifierProvider<PubDevPackageSearchWordState, String>.internal(
      PubDevPackageSearchWordState.new,
      name: r'pubDevPackageSearchWordStateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$pubDevPackageSearchWordStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PubDevPackageSearchWordState = Notifier<String>;
String _$pubDevPackagesPageStateHash() =>
    r'fa605b47791791857c2a92b0e3f8a0ca0e8ecc38';

/// See also [PubDevPackagesPageState].
@ProviderFor(PubDevPackagesPageState)
final pubDevPackagesPageStateProvider = AsyncNotifierProvider<
  PubDevPackagesPageState,
  GetSearchedPackagesResponseBody
>.internal(
  PubDevPackagesPageState.new,
  name: r'pubDevPackagesPageStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pubDevPackagesPageStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PubDevPackagesPageState =
    AsyncNotifier<GetSearchedPackagesResponseBody>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
