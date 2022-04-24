import '../search_items/paapi_search_items_response.dart';

class PaapiGetItemsResponse {
  const PaapiGetItemsResponse({
    this.itemsResult,
  });

  factory PaapiGetItemsResponse.fromJson(Map<String, Object?> json) {
    return PaapiGetItemsResponse(
      itemsResult: PaapiGetItemsResult.fromJson(
        json['ItemsResult']! as Map<String, Object?>,
      ),
    );
  }

  final PaapiGetItemsResult? itemsResult;
}

/// JSON: Map<String, Object?>を変換
/// 複数アイテム情報等を含むデータのルート
class PaapiGetItemsResult {
  const PaapiGetItemsResult({
    this.items = const [],
  });

  factory PaapiGetItemsResult.fromJson(Map<String, Object?> json) {
    final itemList = List<Map<String, Object?>>.from(json['Items']! as List);
    final itemTypeList = itemList.map(PaapiSearchItem.fromJson).toList();
    return PaapiGetItemsResult(
      items: itemTypeList,
    );
  }

  final List<PaapiSearchItem> items;
}
