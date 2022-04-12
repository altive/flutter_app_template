import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/amazon_searcher/amazon_searcher.dart';
import '../../core/stock/stock_entity.dart';
import '../../utils/utils.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';
import 'search_result_state.dart';

/// Amazonで商品検索するためのパラメーター
final searchParamProvider =
    StateProvider<PaapiSearchItemsParameters?>((ref) => null);

/// パラメーターを渡したController
final searchResultControllerProvider =
    StateNotifierProvider<SearchResultController, SearchResultState>((ref) {
  final searchParam = ref.watch(searchParamProvider);
  return SearchResultController(
    ref.read,
    searchParams: searchParam,
  );
});

class SearchResultController extends StateNotifier<SearchResultState> {
  // ----- Constructor ----- //
  SearchResultController(
    this._read, {
    required PaapiSearchItemsParameters? searchParams,
  }) : super(SearchResultState(searchParams: searchParams)) {
    executeSearch();
  }

  final Reader _read;

  PaapiClient get _paapiClient => _read(paapiClientProvider);

  // ----------------------------------------
  // Methods
  // ----------------------------------------
  /// 検索を実行する
  Future<void> executeSearch() async {
    final response =
        await _paapiClient.searchItems(parameters: state.searchParams!);
    // 失敗した場合は `null` を返す
    if (response.statusCode != 200) {
      logger
          .warning('商品検索に失敗: ${response.statusCode}(${response.reasonPhrase})');
      return;
    }
    // 文字化け対策bodyBytes: https://qiita.com/takyam/items/98d6336f1b2fe912fd56
    final responseBody = utf8.decode(response.bodyBytes);
    _retrievingSearchResult(responseBody);
  }

  /// レスポンスのBodyから検索結果を取り出して返す
  void _retrievingSearchResult(String responseBody) {
    final responseJson = json.decode(responseBody) as Map<String, dynamic>;
    final result = PaapiSearchItemResponse.fromJson(responseJson).searchResult;
    // 状態更新
    state = state.copyWith(
      fetching: false,
      searchResult: result,
    );
  }

  /// ストック編集画面へ遷移
  /// 新規登録なので[PaapiSearchItem]を[StockEntity]に変換した物のみを提供する
  Future<Object>? presentStockEditorPage(
    WidgetRef ref,
    PaapiSearchItem item,
    BuildContext context,
  ) async {
    final stock = StockEntity.fromSearchedAmazonItem(item);
    // 編集画面で必要なParameterをセット
    ref.read(stockEditorParameterProvider.state).state =
        StockEditorParameter.createrWithAmazon(stock: stock);
    return Navigator.of(context).pushNamed(
      StockEditorPage.routeName,
    );
  }
}
