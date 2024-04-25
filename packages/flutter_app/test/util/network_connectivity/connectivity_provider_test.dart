import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app/util/network_connectivity/connectivity_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../provider/provider_container.dart';

@GenerateNiceMocks([MockSpec<Connectivity>()])
void main() {
  group('connectivityProvider', () {
    test(
      'Ability to obtain a Connectivity instance from the provider.',
      () async {
        final container = createContainer();
        final target = container.read(connectivityProvider);
        expect(target, isA<Connectivity>());
      },
    );
  });

  group('ConnectivityResultsExtension', () {
    test(
      'If there is any connection, '
      'it is determined that there is a network connection.',
      () async {
        final target = <ConnectivityResult>[
          ConnectivityResult.wifi,
        ];
        expect(target.hasNetworkConnection, isTrue);
        expect(target.hasNotNetworkConnection, isFalse);
      },
    );

    test(
      'If there is no connection, '
      'it is determined that there is no network connection.',
      () async {
        final target = <ConnectivityResult>[
          ConnectivityResult.none,
        ];
        expect(target.hasNetworkConnection, isFalse);
        expect(target.hasNotNetworkConnection, isTrue);
      },
    );
  });
}
