import 'package:collection/collection.dart' show IterableExtension;
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/local_notification_controller/local_notification_controller.dart';
import '../views/stock_list_page/stock_display_mode.dart';
import '../views/stock_list_page/stock_list_filter_state.dart';
import '../views/stock_list_page/stock_list_sort_selection.dart';
import 'ask_app_feeling/ask_app_feeling_state.dart';
import 'theme/ex_theme.dart';

/// ユーザー設定サービスのProvider
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

/// bool, double, int, String, List<String>
class SharedPreferencesService {
  SharedPreferencesService(this._prefs);

  final SharedPreferences _prefs;

  /// すべて削除
  Future<bool> clearAll() async {
    return _prefs.clear();
  }

  /// テーマの選択
  // ---------------------------------
  static const String selectedThemeKey = 'selectedTheme';

  Future<void> saveTheme(ExTheme mode) async {
    await _prefs.setInt(selectedThemeKey, mode.id);
  }

  int? readThemeId() => _prefs.getInt(selectedThemeKey);

  /// 通知の許可訴求ダイアログを表示したか
  // ---------------------------------
  static const String displayedNotificationGuideKey =
      'displayedNotificationGuide';

  Future<void> completeNotificationGuide() async {
    await _prefs.setBool(displayedNotificationGuideKey, true);
  }

  bool get hasNotificationGuideCompleted =>
      _prefs.getBool(displayedNotificationGuideKey) ?? false;

  /// 通知を行う日の設定
  // ----------------------------------
  static const String notificationDaysKey = 'notificationDuration';

  Future<void> saveNotificationDuration({required int days}) async {
    await _prefs.setInt(notificationDaysKey, days);
  }

  NotificationDate? get getNotificationDuration {
    final duration = _prefs.getInt(notificationDaysKey) ?? 3;
    return NotificationDate.values.firstWhereOrNull(
      (element) => element.count == duration,
    );
  }

  /// 通知を行う時間の設定
  // ----------------------------------
  static const String notificationHourSettingKey = 'notificationHourSetting';
  static const String notificationMinuteSettingKey =
      'notificationMinuteSetting';

  Future<void> saveNotificationTimeSetting({
    required TimeOfDay timeOfDay,
  }) async {
    await _prefs.setInt(notificationHourSettingKey, timeOfDay.hour);
    await _prefs.setInt(notificationMinuteSettingKey, timeOfDay.minute);
  }

  TimeOfDay get getNotificationTimeSetting {
    final hour = _prefs.getInt(notificationHourSettingKey) ?? 12;
    final minute = _prefs.getInt(notificationMinuteSettingKey) ?? 0;
    return TimeOfDay(
      hour: hour,
      minute: minute,
    );
  }

  // ストックリストの表示モード方法
  // -----------------------------------
  static const String stockDisplayModeKey = 'stockDisplayMode';

  Future<void> saveStockDisplayMode({required StockDisplayMode mode}) async {
    await _prefs.setString(stockDisplayModeKey, mode.key);
  }

  /// デフォルト値は「期限が近い」
  StockDisplayMode get getStockDisplayMode {
    final key =
        _prefs.getString(stockDisplayModeKey) ?? StockDisplayMode.list.key;
    return StockDisplayMode.values.firstWhere(
      (element) => element.key == key,
      orElse: () => StockDisplayMode.list,
    );
  }

  // ストックリストの並び替え方法
  // -----------------------------------
  static const String stockSortingKey = 'stockSorting';

  Future<void> saveStockSorting({required StockSortSelection sorting}) async {
    await _prefs.setString(stockSortingKey, sorting.key);
  }

  /// デフォルト値は「期限が近い」
  StockSortSelection get getStockSorting {
    final key = _prefs.getString(stockSortingKey) ??
        StockSortSelection.expirationNear.key;
    return StockSortSelection.values.firstWhere(
      (element) => element.key == key,
      orElse: () => StockSortSelection.expirationNear,
    );
  }

  // ストックリストの絞り込み状態
  // ---------------------------------
  static const String stockFilteringInventoryKey = 'stockFilteringInventory';
  static const String stockFilteringExpirationKey = 'stockFilteringExpiration';
  static const String stockFilteringCategoryKey = 'stockFilteringCategory';

  /// 在庫の絞り込みを記憶する
  Future<void> saveStockFilteringInventory(FilteringState value) async {
    await _prefs.setString(
      stockFilteringInventoryKey,
      EnumToString.convertToString(value),
    );
  }

  /// 期限の絞り込みを記憶する
  Future<void> saveStockFilteringExpiration(FilteringState value) async {
    await _prefs.setString(
      stockFilteringExpirationKey,
      EnumToString.convertToString(value),
    );
  }

  /// 商品種類の絞り込みを記憶する
  Future<void> saveStockFilteringCategory(FilteringState value) async {
    await _prefs.setString(
      stockFilteringCategoryKey,
      EnumToString.convertToString(value),
    );
  }

  /// 絞り込み設定をリセットする
  Future<void> resetStockFilter() async {
    _prefs
      ..remove(stockFilteringInventoryKey) // ignore: unawaited_futures
      ..remove(stockFilteringExpirationKey) // ignore: unawaited_futures
      ..remove(stockFilteringCategoryKey); // ignore: unawaited_futures
  }

  /// 全部の絞り込み状態を取得して、クラスにまとめて返す
  HomeStockFilterState get getStockFilterings {
    final inventory = _prefs.getString(stockFilteringInventoryKey) ??
        EnumToString.convertToString(FilteringState.notSelected);
    final expiration = _prefs.getString(stockFilteringExpirationKey) ??
        EnumToString.convertToString(FilteringState.notSelected);
    final category = _prefs.getString(stockFilteringCategoryKey) ??
        EnumToString.convertToString(FilteringState.notSelected);
    return HomeStockFilterState(
      inventory: EnumToString.fromString(FilteringState.values, inventory)!,
      expiration: EnumToString.fromString(FilteringState.values, expiration)!,
      category: EnumToString.fromString(FilteringState.values, category)!,
    );
  }

  // アプリを気に入ったか尋ねるためのカウント
  // -----------------------------------
  static const String askAppFeelCountUpKey = 'askAppFeelCountUp';

  /// アプリを気に入ったか尋ねるためのカウントを増やす
  Future<void> increaseAskAppFeelCount() async {
    final increasedCount = getAskApFeelCount + 1;
    await _prefs.setInt(askAppFeelCountUpKey, increasedCount);
  }

  /// アプリを気に入ったか尋ねるためのカウントを取得
  int get getAskApFeelCount {
    final count = _prefs.getInt(askAppFeelCountUpKey) ?? 0;
    return count;
  }

  /// アプリの使用感を尋ねて最終的にレビューしてもらうための状態を記憶
  // ---------------------------------
  static const String askAppFeelingStateKey = 'askAppFeelingState';

  /// 現在の「アプリの使用感を尋ねて最終的にレビューしてもらうための状態」を取得
  AskAppFeelingState get getAskAppFeelingState {
    // 現在の状態を取得。初期状態は `start`
    final currentState = _prefs.getString(askAppFeelingStateKey) ??
        AskAppFeelingState.start.string;
    return AskAppFeelingStateExt.fromString(currentState);
  }

  /// 「アプリの使用感を尋ねて最終的にレビューしてもらうための状態」を記憶
  void setAskAppFeelingState(AskAppFeelingState state) {
    _prefs.setString(askAppFeelingStateKey, state.string);
  }
}
