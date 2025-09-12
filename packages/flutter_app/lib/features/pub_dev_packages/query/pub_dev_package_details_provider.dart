import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:pub_dev_api_client/pub_dev_api_client.dart';

import '../../../package_adaptor/pub_dev_api_client_provider.dart';

/// Provider for pub.dev package details by package name.
final FutureProviderFamily<GetPackageDetailsResponseBody, String>
pubDevPackageDetailsProvider = FutureProvider.autoDispose
    .family<GetPackageDetailsResponseBody, String>(
      (ref, packageName) async {
        final client = ref.watch(pubDevApiClientProvider);
        final response = await client.getPackageDetails(
          packageName: packageName,
        );
        return response;
      },
    );
