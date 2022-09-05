import 'package:riverpod/riverpod.dart';

import 'remote_config_provider.dart';
import 'remote_parameter_fetcher.dart';

/// Provide RemoteParameterFetcher.
/// With RemoteConfig via remoteConfigProvider.
final remoteParameterFetcherProvider = Provider<RemoteParameterFetcher>((ref) {
  final rc = ref.watch(remoteConfigProvider);
  return RemoteParameterFetcher(rc: rc);
});
