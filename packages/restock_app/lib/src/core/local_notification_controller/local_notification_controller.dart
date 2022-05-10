import 'dart:convert';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../providers/navigator.dart';
import '../../util/shared_preferences_service.dart';
import '../../utils/utils.dart';
import '../../views/stock_detail/stock_detail_page.dart';
import '../stock/stock_repository.dart';
import 'notification_date.dart';
import 'notification_payload.dart';

export 'notification_date.dart';
export 'notification_payload.dart';

final localNotificationControllerProvider =
    StateNotifierProvider<LocalNotificationController, List<int>>((ref) {
  return LocalNotificationController(ref.read);
});

/// flutter_local_notifications を使用して通知を操作する
class LocalNotificationController extends StateNotifier<List<int>> {
  // ----- Constructor ----- //
  LocalNotificationController(this._read)
      : _plugin = FlutterLocalNotificationsPlugin(),
        super(<int>[]) {
    initializeLocalNotifications();
  }

  final Reader _read;

  SharedPreferencesService get _prefsController =>
      _read(sharedPreferencesServiceProvider);

  GlobalKey<NavigatorState> get _navigatorKey => _read(navigatorKeyProvider);

  final FlutterLocalNotificationsPlugin _plugin;

  static const notificationListKey = 'notificationList';

  // --------------------------------
  // flutter_local_notifications API
  // --------------------------------

  /// 保留中の通知リクエストを取得する
  Future<List<PendingNotificationRequest>>
      get getAndStorePendingNotificationRequests async {
    final list = await _plugin.pendingNotificationRequests();
    // 通知リストの`id`を抜き出して`state`に保存
    state = list.map((e) => e.id).toList();
    return list;
  }

  /// 保留中の通知リクエストに[idNumber]が含まれるか調べる
  bool containsNotification(int? idNumber) {
    return state.contains(idNumber);
  }

  /// 保留中の通知リクエストを[idNumber]で検索して最初の一致を返す。無ければ`null`を返す
  Future<PendingNotificationRequest?> firstWhere({
    required int? idNumber,
  }) async {
    final list = await _plugin.pendingNotificationRequests();
    return list.firstWhereOrNull(
      (element) => element.id == idNumber,
    );
  }

  /// 指定したIDの通知をキャンセル/削除
  Future<void> cancel({required int id}) async {
    state = state.where((e) => e != id).toList();
    return _plugin.cancel(id);
  }

  /// すべての通知をキャンセル/削除
  Future<void> canceleAll() async {
    state = [];
    return _plugin.cancelAll();
  }

  /// 通知を介してアプリが起動されたかどうかの詳細を取得する
  Future<String?> notificationAppLaunchPayload() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details == null) {
      return null;
    }
    // 最新化
    await getAndStorePendingNotificationRequests;
    if (details.didNotificationLaunchApp) {
      return details.payload;
    }
    return null;
  }

  /// iOSでは、通知の許可をまだとっていなければ、この初期化時に表示される
  void initializeLocalNotifications() {
    // プラグインを初期化します。app_iconをAndroidヘッドプロジェクトに描画可能なリソースとして追加する必要があります。
    const androidSettings = AndroidInitializationSettings('app_icon');
    const iosSettings = IOSInitializationSettings(
      // 任意のタイミングで通知の許可を得たい場合は3つのPermissionをすべてfalseにする
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      // iOS 10以下のみ対象なので当アプリでは省略する
      // onDidReceiveLocalNotification: ,
    );
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    _plugin.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
    // 最新化
    getAndStorePendingNotificationRequests;
  }

  /// 通知をタップしてアプリを起動した場合のハンドリング
  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      // 最新化
      await getAndStorePendingNotificationRequests;
      logger.info('通知がタップされました。payload: $payload');
      // Payload文字列からNotificationPayloadに変換
      final json = jsonDecode(payload) as Map<String, dynamic>;
      final notificationPayload = NotificationPayload.fromJson(json);
      final stock =
          _read(stockEntityDetailProvider(notificationPayload.documentId));
      await _navigatorKey.currentState!.pushNamed(
        StockDetailPage.routeName,
        arguments: stock,
      );
    }
  }

  /// iOSに通知の許可を得るためのダイアログを表示する
  /// iOS以外の場合は`null`を返す
  /// 許可を得た場合は`true`、拒否された場合は`false`を返す
  Future<bool?> requestLocalNotificationPermission() async {
    final granted = await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    if (granted == null) {
      // iOSではないため対象外
      return null;
    }
    logger.fine('ローカル通知の許可: $granted');
    return granted;
  }

  /// ストック期限の通知を登録する
  /// Androidデバイスのデフォルト動作では、デバイスが低電力アイドルモードの場合、
  /// 指定された時間に通知が配信されない場合があります。
  /// この動作はandroidAllowWhileIdle、scheduleメソッドを呼び出すときに、
  /// 名前付きのオプションパラメータをtrueに設定することで変更できます。
  Future<void> addStockExpirationNotice({
    required String documentId,
    required int idNumber,
    required String itemName,
    required DateTime expirationDate,
  }) async {
    // 重複登録防止
    if (containsNotification(idNumber)) {
      // 登録済みの通知をキャンセルする
      await cancel(id: idNumber);
      state = state.where((e) => e != idNumber).toList();
    }
    // 何日前に通知を送るか
    final durationDays = _prefsController.getNotificationDuration!.count;

    /// 時刻設定
    final timeOfDay = _prefsController.getNotificationTimeSetting;

    /// 通知する日時
    // final scheduleDate = DateTime(
    //   expirationDate.year,
    //   expirationDate.month,
    //   expirationDate.day,
    //   timeOfDay.hour,
    //   timeOfDay.minute,
    // ).subtract(Duration(days: durationDays));

    // ペイロードを作成
    final payloadMap = NotificationPayload(
      documentId: documentId,
      itemName: itemName,
      notificationDurationDays: durationDays,
      expirationDate: expirationDate,
      hour: timeOfDay.hour,
      minute: timeOfDay.minute,
    ).toJson();
    final payloadJson = jsonEncode(payloadMap);

    // 通知の設定
    const androidDetails = AndroidNotificationDetails(
      // Channel ID（通知のカテゴライズID）
      'jp.altive.restock.stock-expiration',
      // Channel Name（通知のカテゴライズ名・端末の設定画面に表示される）
      'ストック期限のお知らせ',
      // Channel Description（通知カテゴライズの説明・端末の設定画面に表示される）
      channelDescription: '登録したストックの賞味期限/消費期限を、設定した日数前にお知らせします。',
    );
    const iosDetails = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    await _plugin.zonedSchedule(
      idNumber,
      '期限のお知らせ',
      '$itemNameの期限まで残り$durationDays日です',
      // TODO(Aimee): timezone部分を確認する
      tz.TZDateTime.now(tz.UTC).add(Duration(days: durationDays)),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: payloadJson,
    );

    // await _plugin.schedule(
    //   idNumber,
    //   '期限のお知らせ',
    //   '$itemNameの期限まで残り$durationDays日です',
    //   scheduleDate,
    //   notificationDetails,
    //   payload: payloadJson,
    // );
    state = [...state, idNumber];
  }

  /* 以下、未使用API

  /// Androidデバイスのデフォルト動作では、デバイスが低電力アイドルモードの場合、
  /// 指定された時間に通知が配信されない場���があります。
  /// この動作はandroidAllowWhileIdle、scheduleメソッドを呼び出すときに、
  /// 名前付きのオプションパラメータをtrueに設定することで変更できます。
  Future<void> sendNotification() async {
    /// Androidデバイスでは、通知はトレイにのみ表示される。
    /// 優先度/重要度などが適切に設定されていない限り、トースト（ヘッドアップ通知）として表示されない
    /// https://developer.android.com/guide/topics/ui/notifiers/notifications.html#Heads-up
    ///
    /// 任意パラメータ[ticker]で古いバージョンのAndroidのステータスバーにテキストを表示できる
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      'channelDescription',
      importance: Importance.High,
      priority: Priority.High,
    );
    const iosDetails = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(
      androidDetails,
      iosDetails,
    );
    await _plugin.show(
      0,
      'title',
      'body',
      notificationDetails,
      payload: 'item x',
    );
  }

  /// 指定した間隔で定期的に通知を表示する
  Future<void> periodicallyNotification(RepeatInterval repeatInterval) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      'channelDescription',
    );
    const iosDetails = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(
      androidDetails,
      iosDetails,
    );
    await _plugin.periodicallyShow(
      0,
      'title',
      'body',
      repeatInterval,
      notificationDetails,
    );
  }

  /// 特定の時間に毎日通知を表示する
  Future<void> dailyAtTimeNotification(Time time) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      'channelDescription',
    );
    const iosDetails = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(
      androidDetails,
      iosDetails,
    );
    await _plugin.showDailyAtTime(
      0,
      'title',
      'body',
      time,
      notificationDetails,
    );
  }

  /// 特定の日時に毎週通知を表示する
  Future<void> weeklyAtDayAndTimeNotification({
    @required Day dayOfWeek,
    @required Time time,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      'channelDescription',
    );
    const iosDetails = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(
      androidDetails,
      iosDetails,
    );
    await _plugin.showWeeklyAtDayAndTime(
      0,
      'title',
      'body',
      dayOfWeek,
      time,
      notificationDetails,
    );
  }
  
  未使用APIここまで */
}
