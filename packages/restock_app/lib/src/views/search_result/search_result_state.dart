import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_state.freezed.dart';

@freezed
class SearchResultState with _$SearchResultState {
  const factory SearchResultState({
    // ローディング中かどうか
    @Default(true) bool fetching,
    PaapiSearchItemsResult? searchResult,
    PaapiSearchItemsParameters? searchParams,
  }) = _SearchResultState;
}
