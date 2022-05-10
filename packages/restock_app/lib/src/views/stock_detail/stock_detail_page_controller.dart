import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../core/revenue/revenue.dart';
import '../../core/stock/stock_entity.dart';
import '../../core/stock/stock_repository.dart';
import '../../util/shared_preferences_service.dart';

/// ストック詳細画面で表示するストックのID
/// Riverpod 1.0後、ScopedなProviderに変更したい。初期値 throw UnimplementedError()
final selectedStockIdForStockDetailProvider =
    StateProvider<String>((ref) => '');

/// ストック詳細画面で表示するストック
final stockForStockDetailProvider = Provider<StockEntity?>((ref) {
  final id = ref.watch(selectedStockIdForStockDetailProvider);
  final stock = ref.watch(stockEntityDetailProvider(id));
  return stock;
});

final stockDetailPageControllerProvider =
    StateNotifierProvider<StockDetailPageController, bool>((ref) {
  return StockDetailPageController(ref.read);
});

/// ストック詳細画面のロジック担当
class StockDetailPageController extends StateNotifier<bool> {
  // ----- Constructor ----- //
  StockDetailPageController(this._read) : super(false);

  final Reader _read;

  StockRepository? get _stockRepository => _read(stockRepositoryProvider);

  /// ストック情報（readなので更新は追従されない）
  StockEntity? get _stock => _read(stockForStockDetailProvider);

  SharedPreferencesService get _prefsController =>
      _read(sharedPreferencesServiceProvider);

  LocalNotificationController get _notificationController =>
      _read(localNotificationControllerProvider.notifier);

  /// Payload取得
  Future<NotificationPayload?> fetchNotificationPayload() async {
    final notification =
        await _notificationController.firstWhere(idNumber: _stock?.idNumber);
    if (notification == null) {
      return null;
    }
    return NotificationPayload.fromString(notification.payload!);
  }

  /// 通知時刻を取得
  /// 通知登録済みなら、登録済みの時刻設定を
  /// 未登録なら共有設定の時刻設定を返す
  TimeOfDay getNotificationTimes(NotificationPayload? payload) {
    return payload == null
        ? _prefsController.getNotificationTimeSetting
        : TimeOfDay(
            hour: payload.hour,
            minute: payload.minute,
          );
  }

  /// 何日前に通知するのかを取得
  /// 通知登録済みなら、登録済みの「●日前」設定を
  /// 未登録なら共有設定の「●日前」設定を返す
  int getNotificationDuration(NotificationPayload? payload) {
    return payload == null
        ? _prefsController.getNotificationDuration.count
        : payload.notificationDurationDays;
  }

  /// 個数を1増やす
  Future<void> incrementItem() async {
    return _stockRepository?.increaseNumberOfItems(_stock?.id, value: 1);
  }

  /// 個数を1減らす
  Future<void> decrementItem() async {
    return _stockRepository?.decreaseNumberOfItems(_stock?.id, value: 1);
  }

  /// 個数を0にする
  Future<bool> reduceItemToZero() async {
    await _stockRepository?.reduceItemToZero(_stock?.id);
    return true;
  }

  /// 通知を追加する
  Future<String?> addNotification() async {
    final stock = _stock;
    if (stock == null) {
      return null;
    }
    // 通知予定日のチェックを行う
    // 何日前に通知するか
    final durationDays = _prefsController.getNotificationDuration.count;
    // 通知する日付
    final notificationDate = stock.expirationAt!.subtract(
      Duration(days: durationDays),
    );
    // 通知予定日がもう過ぎてしまっているか
    final isDatePassed = DateTime.now().isAfter(notificationDate);
    if (isDatePassed) {
      return '通知予定日を過ぎている、または当日のため通知をONにできません。';
    }
    // 通知個数のチェックを行う
    final pendingList =
        await _notificationController.getAndStorePendingNotificationRequests;
    final isProUser = _read(revenueControllerProvider).isSubscriber;
    if (!isProUser && pendingList.length >= 10) {
      // 非Proユーザーは10を超えて登録できない
      return '通知は10件までとなります。';
    }
    // 通知追加
    await _notificationController.addStockExpirationNotice(
      documentId: stock.id!,
      idNumber: stock.idNumber,
      itemName: stock.name.value,
      expirationDate: stock.expirationAt!,
    );
    return null;
  }

  /// 通知を削除する
  Future<void> removeNotification() async {
    final stock = _stock;
    if (stock == null) {
      return;
    }
    // このアイテムの通知をキャンセル
    await _notificationController.cancel(id: stock.idNumber);
  }

  /// ストックアイテムを削除する
  Future<void> deleteItem() async {
    final stock = _stock;
    if (stock == null) {
      return;
    }
    return _stockRepository?.delete(stock.id);
  }
}
