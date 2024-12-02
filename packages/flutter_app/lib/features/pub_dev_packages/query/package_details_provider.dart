import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../package_adaptor/rest_api_client_provider.dart';

part 'package_details_provider.g.dart';

/// Provider for package details by package name.
@riverpod
Future<GetPackageResponseBody> packageDetails(
  Ref ref, {
  required String packageName,
}) async {
  final client = ref.watch(restApiClientProvider);
  final response = await client.getPackage(packageName: packageName);
  return response;
}
