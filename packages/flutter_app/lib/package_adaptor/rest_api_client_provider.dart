import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_api_client_provider.g.dart';

@Riverpod(keepAlive: true)
RestApiClient restApiClient(Ref ref) {
  return RestApiClient.fromParameters(
    baseUrl: 'https://pub.dev/api',
    timeoutDuration: const Duration(seconds: 30),
  );
}
