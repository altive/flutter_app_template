import '../search_items/paapi_search_items_response.dart';

class PaapiGetItemsResponse {
  const PaapiGetItemsResponse({
    this.itemsResult,
  });

  factory PaapiGetItemsResponse.fromJson(Map<String, dynamic> json) {
    return PaapiGetItemsResponse(
      itemsResult: PaapiGetItemsResult.fromJson(
          json['ItemsResult'] as Map<String, dynamic>),
    );
  }

  final PaapiGetItemsResult? itemsResult;
}

/// JSON: Map<String, dynamic>を変換
/// 複数アイテム情報等を含むデータのルート
class PaapiGetItemsResult {
  const PaapiGetItemsResult({
    this.items = const [],
  });

  factory PaapiGetItemsResult.fromJson(Map<String, dynamic> json) {
    final itemList =
        List<Map<String, dynamic>>.from(json['Items'] as List<dynamic>);
    final itemTypeList =
        itemList.map((dic) => PaapiSearchItem.fromJson(dic)).toList();
    return PaapiGetItemsResult(
      items: itemTypeList,
    );
  }

  final List<PaapiSearchItem> items;
}
