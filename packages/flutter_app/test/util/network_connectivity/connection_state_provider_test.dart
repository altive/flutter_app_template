import 'dart:async';

import 'package:flutter_app/util/network_connectivity/network_connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../provider/provider_container.dart';
import 'connectivity_provider_test.mocks.dart';

void main() {
  group('NetworkConnectionState', () {
    test(
      'No connection shall be considered as no network connection',
      () async {
        final mockConnectivity = MockConnectivity();
        final container = createContainer(
          overrides: [
            connectivityProvider.overrideWithValue(mockConnectivity),
          ],
        );

        final streamController = StreamController<List<ConnectivityResult>>();
        addTearDown(streamController.close);

        when(mockConnectivity.onConnectivityChanged)
            .thenAnswer((_) => streamController.stream);

        streamController.add([ConnectivityResult.none]);

        final target =
            await container.read(networkConnectionStateProvider.future);
        expect(target.hasNetworkConnection, isFalse);
      },
    );

    test(
      'If there is a connection, the network connection is considered to exist',
      () async {
        final mockConnectivity = MockConnectivity();
        final container = createContainer(
          overrides: [
            connectivityProvider.overrideWithValue(mockConnectivity),
          ],
        );

        final streamController = StreamController<List<ConnectivityResult>>();
        addTearDown(streamController.close);

        when(mockConnectivity.onConnectivityChanged)
            .thenAnswer((_) => streamController.stream);

        streamController.add([ConnectivityResult.wifi]);

        final target =
            await container.read(networkConnectionStateProvider.future);
        expect(target.hasNetworkConnection, isTrue);
      },
    );
  });
}
