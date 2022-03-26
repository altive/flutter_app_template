import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'revenue_state.freezed.dart';

@freezed
class RevenueState with _$RevenueState {
  const factory RevenueState({
    /// サブスクリプション契約中かどうか default: false
    @Default(false) bool isSubscriber,

    /// 情報更新日時
    String? updatedDateString,

    /// 最新の有効期限日
    String? latestExpirationDateString,
  }) = _RevenueState;
}
