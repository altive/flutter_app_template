import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_sender/notification_sender.dart';

import '../../util/shared_preferences_service.dart';
import 'notification_payload.dart';

export 'notification_date.dart';
export 'notification_payload.dart';

final expirationNotificationRegistrarProvider = Provider(
  ExpirationNotificationRegistrar.new,
);

class ExpirationNotificationRegistrar {
  ExpirationNotificationRegistrar(this._ref);

  final Ref _ref;

  NotificationSender get _sender =>
      _ref.read(notificationSenderProvider.notifier);

  /// アプリ設定を取得するために使用する
  SharedPreferencesService get _prefsController =>
      _ref.read(sharedPreferencesServiceProvider);

  /// Channel ID（通知のカテゴライズID）
  static const String _androidChannelId = 'jp.altive.restock.stock-expiration';

  /// Channel Name（通知のカテゴライズ名・端末の設定画面に表示される）
  /// Example: Expiration notice
  static const String _androidChannelName = 'ストック期限のお知らせ';

  /// Channel Description（通知カテゴライズの説明・端末の設定画面に表示される）
  static const String _androidChannelDescription =
      '登録したストックの賞味期限/消費期限を、設定した日数前にお知らせします。';

  /// 通知をグループ化するために使用できるスレッド識別子
  static const String _appleGroupingId = 'jp.altive.restock.stock-expiration';

  /// ストック期限の通知を登録する
  /// [expirationDate]に期限日時を指定する。
  Future<void> addStockExpirationNotice({
    required String documentId,
    required int idNumber,
    required String itemName,
    required DateTime expirationDate,
  }) async {
    // 何日前に通知を送るかを設定から取得
    final daysAgo = _prefsController.getNotificationDuration!.count;
    // 時刻設定を設定から取得
    final notificationTime = _prefsController.getNotificationTimeSetting;

    /// 通知を実行する日時
    final scheduleDateTime = DateTime(
      expirationDate.year,
      expirationDate.month,
      expirationDate.day,
      notificationTime.hour,
      notificationTime.minute,
    ).subtract(Duration(days: daysAgo));

    final duration = scheduleDateTime.difference(DateTime.now());

    debugPrint('Duration: ${duration.toString()}');

    // ペイロードを作成
    final payloadMap = NotificationPayload(
      documentId: documentId,
      itemName: itemName,
      notificationDurationDays: daysAgo,
      expirationDate: expirationDate,
      hour: notificationTime.hour,
      minute: notificationTime.minute,
    ).toJson();
    final payloadString = jsonEncode(payloadMap);

    await _sender.schedule(
      id: idNumber,
      title: '期限のお知らせ',
      body: '$itemNameの期限まで残り$daysAgo日です',
      duration: duration,
      payload: payloadString,
      androidChannelId: _androidChannelId,
      androidChannelName: _androidChannelName,
      androidChannelDescription: _androidChannelDescription,
      appleGroupingId: _appleGroupingId,
    );
  }
}
