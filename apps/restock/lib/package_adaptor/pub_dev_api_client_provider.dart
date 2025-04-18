import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_dev_api_client/pub_dev_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pub_dev_api_client_provider.g.dart';

@Riverpod(keepAlive: true)
PubDevApiClient pubDevApiClient(Ref ref) {
  return PubDevApiClient.fromParameters(
    baseUrl: 'https://pub.dev/api',
    timeoutDuration: const Duration(seconds: 30),
  );
}
