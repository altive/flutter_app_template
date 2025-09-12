import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'connectivity_provider.dart';

/// Manage and provide network connection status.
class NetworkConnectionState extends AsyncNotifier<List<ConnectivityResult>> {
  @override
  FutureOr<List<ConnectivityResult>> build() async {
    final subscription = _connectivity.onConnectivityChanged.listen((event) {
      state = AsyncData(event);
    });

    ref.onDispose(subscription.cancel);

    return [];
  }

  Connectivity get _connectivity => ref.read(connectivityProvider);
}

final networkConnectionStateProvider =
    AsyncNotifierProvider<NetworkConnectionState, List<ConnectivityResult>>(
      NetworkConnectionState.new,
    );
