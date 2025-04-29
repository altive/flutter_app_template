import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'connectivity_provider.dart';

part 'network_connection_state_provider.g.dart';

/// Manage and provide network connection status.
@riverpod
class NetworkConnectionState extends _$NetworkConnectionState {
  @override
  Future<List<ConnectivityResult>> build() async {
    final subscription = _connectivity.onConnectivityChanged.listen((event) {
      state = AsyncData(event);
    });

    ref.onDispose(subscription.cancel);

    return [];
  }

  Connectivity get _connectivity => ref.read(connectivityProvider);
}
