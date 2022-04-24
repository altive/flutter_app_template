import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paapi_search_items_parameters.freezed.dart';

/// AmazonAPIで検索する時に投げるパラメーター
@freezed
class PaapiSearchItemsParameters with _$PaapiSearchItemsParameters {
  const factory PaapiSearchItemsParameters({
    // 検索キーワードまたはフレーズ
    String? keyword,
    // 欲しいレスポンス情報
    @Default(<String>[]) List<String> resources,
    // 検索対象の製品カテゴリ
    String? searchIndex,
    // 幾つの検索結果を返却するか
    int? itemCount,
    // 検索結果のうちの何ページを目を返却するか
    int? itemPage,
  }) = _PaapiSearchItemsParameters;
}
