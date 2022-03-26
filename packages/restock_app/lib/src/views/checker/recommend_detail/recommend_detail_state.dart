import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_detail_state.freezed.dart';

@freezed
class RecommendDetailState with _$RecommendDetailState {
  const factory RecommendDetailState({
    // ローディング中かどうか
    @Default(true) bool fetching,
    // 商品検索結果
    PaapiGetItemsResult? itemResult,
  }) = _RecommendDetailState;
}
