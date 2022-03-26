import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../everyones_stock/everyones_stock_model.dart';

part 'timeline_state.freezed.dart';

@freezed
class TimelineState with _$TimelineState {
  const factory TimelineState({
    // 読み込み中かどうか
    @Default(false) bool loading,
    // 表示しているアイテムリスト
    @Default(<EveryonesStockModel>[]) List<EveryonesStockModel> displayItems,
    // 更新待ちのアイテムリスト（未使用）
    // List<TimelineItem> waitingItems,
  }) = _TimelineState;
}
