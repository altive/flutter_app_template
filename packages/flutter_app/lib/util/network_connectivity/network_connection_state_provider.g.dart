// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'network_connection_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkConnectionStateHash() =>
    r'29afce1c87f4e1a338ac49291871e9fe6df473e1';

/// Manage and provide network connection status.
///
/// Copied from [NetworkConnectionState].
@ProviderFor(NetworkConnectionState)
final networkConnectionStateProvider = AutoDisposeAsyncNotifierProvider<
    NetworkConnectionState, List<ConnectivityResult>>.internal(
  NetworkConnectionState.new,
  name: r'networkConnectionStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkConnectionStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkConnectionState
    = AutoDisposeAsyncNotifier<List<ConnectivityResult>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
