import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_detail_state.freezed.dart';

@freezed
class StockDetailState with _$StockDetailState {
  const factory StockDetailState({
    // 通知のON/OFF
    @Default(false) bool isNotificationEnabled,
    // 通知する日時
    DateTime? notificationDate,
    // 何日前に通知するか
    int? notificationDurationDays,
    // 通知する時刻
    TimeOfDay? notificationTime,
  }) = _ItemDetailState;
}
