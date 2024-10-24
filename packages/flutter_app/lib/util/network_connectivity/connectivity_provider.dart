import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// Provide a Connectivity instance of the connectivity_plus package.
@riverpod
Connectivity connectivity(Ref ref) {
  return Connectivity();
}

/// The list ConnectivityResult will never be empty.
extension ConnectivityResultsExtension on List<ConnectivityResult> {
  /// If `none` is included,
  /// it can be determined that there is no network connection.
  bool get hasNetworkConnection => !contains(ConnectivityResult.none);

  /// If `none` is not included,
  /// it can be determined that there is some network connection.
  bool get hasNotNetworkConnection => !hasNetworkConnection;
}
