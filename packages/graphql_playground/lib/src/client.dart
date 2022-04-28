import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'environment/environment.dart';

final apiClientProvider = Provider((ref) {
  final token = ref.watch(environmentProvider).token;
  return ApiClient(
    endpoint: 'https://pokeapi.dev',
    token: token,
  );
});

class ApiClient {
  ApiClient({
    required this.endpoint,
    this.token,
  });
  final String endpoint;
  final String? token;

  final cache = Cache();
  late final link = HttpLink(endpoint);

  late final _executor = Client(link: link, cache: cache);

  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    Stream<OperationResponse<TData, TVars>> Function(
            OperationRequest<TData, TVars>)?
        forward,
  ]) {
    return _executor.request(request, forward);
  }
}
