import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_dev_api_client/pub_dev_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../package_adaptor/pub_dev_api_client_provider.dart';

part 'package_details_provider.g.dart';

/// Provider for package details by package name.
@riverpod
Future<GetPackageDetailsResponseBody> packageDetails(
  Ref ref, {
  required String packageName,
}) async {
  final client = ref.watch(pubDevApiClientProvider);
  final response = await client.getPackageDetails(packageName: packageName);
  return response;
}
