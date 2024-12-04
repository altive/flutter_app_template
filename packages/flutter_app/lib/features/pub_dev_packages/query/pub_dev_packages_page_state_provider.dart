import 'package:pub_dev_api_client/pub_dev_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../package_adaptor/pub_dev_api_client_provider.dart';

part 'pub_dev_packages_page_state_provider.g.dart';

@Riverpod(keepAlive: true)
class PackageSearchWordState extends _$PackageSearchWordState {
  @override
  String build() => '';

  // Update the search word.
  // ignore: use_setters_to_change_properties
  void update(String word) {
    state = word;
  }

  // Clear the search word.
  void clear() {
    state = '';
  }
}

@Riverpod(keepAlive: true)
class PubDevPackagesPageState extends _$PubDevPackagesPageState {
  @override
  Future<GetSearchedPackagesResponseBody> build() async {
    final searchWord = ref.watch(packageSearchWordStateProvider);
    final client = ref.watch(pubDevApiClientProvider);
    final response = await client.getSearchedPackages(searchWord: searchWord);
    return response;
  }

  Future<void> loadNext(int nextPage) async {
    state = const AsyncLoading<GetSearchedPackagesResponseBody>()
        .copyWithPrevious(state);

    final searchWord = ref.read(packageSearchWordStateProvider);
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
