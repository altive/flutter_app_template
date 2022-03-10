import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_entrance_state.freezed.dart';

@freezed
class SearchEntranceState with _$SearchEntranceState {
  const factory SearchEntranceState({
    // 検索フィールド用文字列
    @Default('') String searchText,
    @Default(SearchItemsCategory.all) SearchItemsCategory searchItemsCategory,
    // ASINによる商品検索の結果
    List<PaapiSearchItem>? recommendProducts,
  }) = _SearchEntranceState;
}
