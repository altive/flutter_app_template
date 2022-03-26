import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_payload.freezed.dart';
part 'notification_payload.g.dart';

/// ローカル通知のペイロードモデル
@freezed
class NotificationPayload with _$NotificationPayload {
  // データ型を定義
  const factory NotificationPayload({
    required String documentId,
    required String itemName,
    required DateTime expirationDate,
    required int notificationDurationDays,
    required int hour,
    required int minute,
  }) = _NotificationPayload;

  // カスタムメソッド・Getterを定義するために必要（with も implements に変更する）
  const NotificationPayload._();

  /// JSON(Map)形式から変換する（toJsonも生成される）
  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadFromJson(json);

  /// JSON(String)形式から変換する
  factory NotificationPayload.fromString(String payload) {
    final payloadMap = jsonDecode(payload) as Map<String, dynamic>;
    return NotificationPayload.fromJson(payloadMap);
  }
}
