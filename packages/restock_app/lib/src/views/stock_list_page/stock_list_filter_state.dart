import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/shared_preferences_service.dart';

part 'stock_list_filter_state.freezed.dart';

/// ストックリストの絞り込み表示設定状態を提供する
/// 初期値はSharedPreferencesに記憶済みの値から取得する
final stockFilterProvider = StateProvider(
  (ref) => ref.watch(sharedPreferencesServiceProvider).getStockFilterings,
);

@freezed
class HomeStockFilterState with _$HomeStockFilterState {
  const factory HomeStockFilterState({
    /// 在庫
    @Default(FilteringState.notSelected) FilteringState inventory,

    /// 期限
    @Default(FilteringState.notSelected) FilteringState expiration,

    /// 種類
    @Default(FilteringState.notSelected) FilteringState category,
  }) = _HomeStockFilterState;

  const HomeStockFilterState._();

  // bool get isAllOn => isHasStockOnly && isHasExpirationOnly;
  // bool get isAllOff => !isHasStockOnly && !isHasExpirationOnly;
}

enum FilteringState {
  notSelected,
  yes,
  no,
}

extension FilteringStateExt on FilteringState {
  bool get isNotSelected => this == FilteringState.notSelected;
  bool get isYes => this == FilteringState.yes;
  bool get isNo => this == FilteringState.no;
}
