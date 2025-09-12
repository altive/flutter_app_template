import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_dev_api_client/pub_dev_api_client.dart';

final pubDevApiClientProvider = Provider<PubDevApiClient>((ref) {
  return PubDevApiClient.fromParameters(
    baseUrl: 'https://pub.dev/api',
    timeoutDuration: const Duration(seconds: 30),
  );
});
