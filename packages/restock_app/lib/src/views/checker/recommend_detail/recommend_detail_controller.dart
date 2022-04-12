import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/amazon_searcher/amazon_searcher.dart';
import '../../../models/remote_config/recommend_stock_set_parameter.dart';
import '../../../util/favorite_controller.dart';
import '../../../utils/utils.dart';
import 'recommend_detail_state.dart';

/// 詳細ページで表示する情報を詰めたパラメータ
final recommendDetailParameterProvider = StateProvider<RecommendStockSet?>(
  (ref) => null,
);

/// パラメーターを渡したController
final recommendDetailProvider =
    StateNotifierProvider<RecommendDetailController, RecommendDetailState>(
        (ref) {
  final setList = ref.watch(recommendDetailParameterProvider);
  return RecommendDetailController(
    ref.read,
    setList,
  );
});

/// お勧め詳細ページの状態操作、ロジック部分を受け持つ
class RecommendDetailController extends StateNotifier<RecommendDetailState> {
  // Constructor
  // ----------------------------------------
  RecommendDetailController(
    this._read,
    this.setList,
  ) : super(const RecommendDetailState()) {
    executeSearch();
  }

  final Reader _read;
  final RecommendStockSet? setList;

  FavoriteController get favoriteController => _read(favoriteProvider);
  PaapiClient get _paapiClient => _read(paapiClientProvider);

  // Methods
  // ----------------------------------------
  /// 検索を実行する
  Future<void> executeSearch() async {
    final param = PaapiGetItemsParameters(
      asin: setList!.itemList.map((e) => e.asin).toList(),
      resources: [
        'Images.Primary.Small',
        'Images.Primary.Medium',
        'Images.Primary.Large',
        'ItemInfo.Title',
        'ItemInfo.Classifications',
        'Offers.Listings.Price'
      ],
    );
    final response = await _paapiClient.getItems(parameters: param);
    if (response == null || response.statusCode != 200) {
      // 失敗した場合
      logger.warning(
        '商品検索に失敗: ${response?.statusCode}(${response?.reasonPhrase})',
      );
      return;
    }
    // 文字化け対策bodyBytes: https://qiita.com/takyam/items/98d6336f1b2fe912fd56
    final responseBody = utf8.decode(response.bodyBytes);
    _retrievingSearchResult(responseBody);
  }

  /// レスポンスのBodyから検索結果を取り出して返す
  void _retrievingSearchResult(String responseBody) {
    final responseJson = json.decode(responseBody) as Map<String, dynamic>;
    final result = PaapiGetItemsResponse.fromJson(responseJson).itemsResult;
    // 状態更新
    state = state.copyWith(
      fetching: false,
      itemResult: result,
    );
  }
}
