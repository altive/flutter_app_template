import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'remote_config_provider.dart';
import 'remote_parameter_fetcher.dart';

part 'remote_parameter_fetcher_provider.g.dart';

/// Provide RemoteParameterFetcher.
/// With RemoteConfig via remoteConfigProvider.
@Riverpod(keepAlive: true)
RemoteParameterFetcher remoteParameterFetcher(RemoteParameterFetcherRef ref) {
  final rc = ref.watch(remoteConfigProvider);
  return RemoteParameterFetcher(rc: rc);
}
