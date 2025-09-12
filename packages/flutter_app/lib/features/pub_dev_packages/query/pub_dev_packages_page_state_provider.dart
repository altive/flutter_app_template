import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_dev_api_client/pub_dev_api_client.dart';

import '../../../package_adaptor/pub_dev_api_client_provider.dart';

/// Provider for the search word of pub.dev packages.
class PubDevPackageSearchWordState extends Notifier<String> {
  @override
  String build() => '';

  /// Update the search word.
  // ignore: use_setters_to_change_properties
  void update(String word) {
    state = word;
  }

  /// Clear the search word.
  void clear() {
    state = '';
  }
}

final pubDevPackageSearchWordStateProvider =
    NotifierProvider<PubDevPackageSearchWordState, String>(
      PubDevPackageSearchWordState.new,
    );

class PubDevPackagesPageState
    extends AsyncNotifier<GetSearchedPackagesResponseBody> {
  @override
  Future<GetSearchedPackagesResponseBody> build() async {
    final searchWord = ref.watch(pubDevPackageSearchWordStateProvider);
    final client = ref.watch(pubDevApiClientProvider);
    final response = await client.getSearchedPackages(searchWord: searchWord);
    return response;
  }

  Future<void> loadNext(int nextPage) async {
    state = const AsyncLoading<GetSearchedPackagesResponseBody>()
        // Note: This is a workaround to avoid the error.
        // ignore: invalid_use_of_internal_member
        .copyWithPrevious(state);

    final searchWord = ref.read(pubDevPackageSearchWordStateProvider);
    final client = ref.read(pubDevApiClientProvider);
    final response = await client.getSearchedPackages(
      searchWord: searchWord,
      page: nextPage,
    );
    final currentPackages = state.requireValue.packages;
    final newPackages = [...currentPackages, ...response.packages];

    state = AsyncData(
      GetSearchedPackagesResponseBody(
        packages: newPackages,
        nextPageUrl: response.nextPageUrl,
      ),
    );
  }
}

final pubDevPackagesPageStateProvider =
    AsyncNotifierProvider<
      PubDevPackagesPageState,
      GetSearchedPackagesResponseBody
    >(PubDevPackagesPageState.new);
