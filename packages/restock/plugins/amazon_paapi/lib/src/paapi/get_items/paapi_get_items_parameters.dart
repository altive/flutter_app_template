import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paapi_get_items_parameters.freezed.dart';

@freezed
class PaapiGetItemsParameters with _$PaapiGetItemsParameters {
  const factory PaapiGetItemsParameters({
    // Amazon Standard Identification Number: 10文字のユニークな英数字
    @Default(<String>[]) List<String> asin,
    // 欲しいレスポンス情報
    @Default(<String>[]) List<String> resources,
  }) = _PaapiGetItemsParameters;
}
