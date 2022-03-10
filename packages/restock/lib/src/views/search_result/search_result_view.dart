import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../core/stock/stock_repository.dart';
import 'search_result_controller.dart';
import 'search_result_item_card.dart';

class SearchResultView extends HookWidget {
  // Constructor
  // ----------------------------------
  const SearchResultView({Key? key}) : super(key: key);

  // Field
  // ----------------------------------------
  static const String routeName = '/search-result';

  // Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    final state = useProvider(searchResultControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('検索結果')),
      body: SafeArea(
        child: state.fetching
            ? const LoadingIndicator()
            : state.searchResult == null
                ? const _EmptyView()
                : ResultListView(searchResult: state.searchResult),
      ),
    );
  }
}

/// 商品がなかったときの画面
class _EmptyView extends StatelessWidget {
  const _EmptyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('検索結果がありませんでした'));
  }
}

/// 検索結果のリストを表示
class ResultListView extends HookWidget {
  const ResultListView({
    Key? key,
    required this.searchResult,
  }) : super(key: key);

  final PaapiSearchItemsResult? searchResult;

  @override
  Widget build(BuildContext context) {
    final stockList = useProvider(stockEntityListProvider);
    if (stockList == null) {
      return const SizedBox();
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      itemCount: searchResult!.items.length,
      itemBuilder: (context, index) {
        final resultItem = searchResult!.items[index];
        return SearchResultItemCard(
          searchItem: resultItem,
          stockList: stockList,
        );
      },
    );
  }
}
