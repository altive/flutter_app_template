import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/amazon_searcher/amazon_searcher.dart';
import '../../core/stock/stock_entity.dart';
import '../../models/remote_config/remote_config_provider.dart';
import '../../utils/utils.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';
import 'search_entrance_state.dart';

final searchEntranceProvider =
    StateNotifierProvider<SearchEntranceController, SearchEntranceState>(
  (ref) => SearchEntranceController(ref.read),
);

/// ストックを追加するためにアイテムを色々探すための最初の画面
class SearchEntranceController extends StateNotifier<SearchEntranceState> {
  // Construct
  SearchEntranceController(this._read) : super(const SearchEntranceState()) {
    getItems();
  }

  final Reader _read;

  PaapiClient get _paapiClient => _read(paapiClientProvider);

  // 編集された検索文字列で更新する
  void editSearchText(String? text) =>
      state = state.copyWith(searchText: text ?? '');

  /// ASINで単独商品を検索し、検索成功なら検索結果を返却する
  /// ASINリストは上限10個なので注意
  Future<void> getItems() async {
    final remoteConfig = await _read(remoteConfigProvider.future);
    if (remoteConfig == null) {
      return;
    }
    final asinList = remoteConfig.recommendedAsinListForSearchEntrance;

    var asinListMax10 = asinList;
    // ASINは上限10個なので超える場合は切り捨て
    if (asinList.length > 10) {
      logger.warning('ASINが10個を超えているため、11個目以降は削除します');
      asinListMax10 = asinList.sublist(0, 10);
    }
    final response = await _paapiClient.getItems(
      parameters: PaapiGetItemsParameters(
        asin: asinListMax10,
        resources: [
          'Images.Primary.Small',
          'Images.Primary.Medium',
          'Images.Primary.Large',
          'ItemInfo.Title',
          'ItemInfo.Classifications',
          'Offers.Listings.Price'
        ],
      ),
    );
    // 失敗した場合は `null` を返す
    if (response == null || response.statusCode != 200) {
      logger.warning(
        '商品特定に失敗: ${response?.statusCode}(${response?.reasonPhrase})',
      );
      return;
    }
    // 文字化け対策bodyBytes: https://qiita.com/takyam/items/98d6336f1b2fe912fd56
    final responseBody = utf8.decode(response.bodyBytes);
    // レスポンスBodyからResultを取り出す
    final result = _retrievingGetResult(responseBody);
    // 状態更新
    if (mounted) {
      state = state.copyWith(recommendProducts: result!.items);
    }
  }

  /// 商品検索のためのParametersを返却する
  PaapiSearchItemsParameters genetateParams({
    /// 検索対象カテゴリの指定（外部から指定された場合はstateを使用しない）
    SearchItemsCategory? category,
  }) {
    category ??= state.searchItemsCategory;
    return PaapiSearchItemsParameters(
      keyword: state.searchText,
      searchIndex: category.searchIndex,
      resources: [
        'Images.Primary.Small',
        'Images.Primary.Medium',
        'Images.Primary.Large',
        'ItemInfo.Title',
        'ItemInfo.Classifications',
        'Offers.Listings.Price'
      ],
    );
  }

  /// レスポンスのBodyから検索結果を取り出して返す
  PaapiGetItemsResult? _retrievingGetResult(String responseBody) {
    final responseJson = json.decode(responseBody) as Map<String, dynamic>;
    final result = PaapiGetItemsResponse.fromJson(responseJson).itemsResult;
    return result;
  }

  /// 検索対象カテゴリを変更する
  void changeSearchItemsCategory(SearchItemsCategory? category) {
    if (category == null) {
      return;
    }
    // 状態更新
    state = state.copyWith(searchItemsCategory: category);
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
