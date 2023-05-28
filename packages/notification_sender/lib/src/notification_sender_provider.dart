import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'notification_sender_provider.g.dart';

typedef OnDidReceiveLocalNotification = void Function(
  int,
  String?,
  String?,
  String?,
)?;

/// ローカル通知の表示・スケジュール登録に関する機能（責務）を担う。
///
/// アプリの起動をトリガーする通知（ディープリンクのためにアプリのホームルートを変更するなど）
/// を処理する必要がある場合は、アプリの起動時に getNotificationAppLaunchDetails メソッドを使用します。
/// コールバックで通知がタップされたときに起動する関数 (onDidReceiveNotificationResponse) を指定
@Riverpod(keepAlive: true)
class NotificationSender extends _$NotificationSender {
  NotificationSender({FlutterLocalNotificationsPlugin? notifier})
      : _notifier = notifier ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _notifier;

  @override
  List<PendingNotificationRequest> build() => [];

  /// iOS特有の機能を使用するためのプラグインを提供する。
  /// iOSで起動されていなければnullになる。
  IOSFlutterLocalNotificationsPlugin? get _iosNotifier =>
      _notifier.resolvePlatformSpecificImplementation();

  /// macOS特有の機能を使用するためのプラグインを提供する。
  /// macOSで起動されていなければnullになる。
  MacOSFlutterLocalNotificationsPlugin? get _macOSNotifier =>
      _notifier.resolvePlatformSpecificImplementation();

  /// まず最初にこのメソッドをコールする必要がある。
  /// iOSの場合、[requestAlertPermission],[requestBadgePermission],
  /// [requestSoundPermission]のいずれかが`true`の場合は権限要求のダイアログが表示される。
  /// [onDidReceiveLocalNotification]は iOS 10未満のみで使用される。
  Future<void> initialize({
    required String androidDefaultIcon,
    bool requestAlertPermission = false,
    bool requestBadgePermission = false,
    bool requestSoundPermission = false,
    OnDidReceiveLocalNotification onDidReceiveLocalNotification,
  }) async {
    tz.initializeTimeZones();

    final androidInitializationSettings =
        AndroidInitializationSettings(androidDefaultIcon);

    final iOSInitializationSettings = DarwinInitializationSettings(
      // initializeと同時に通知権限を要求したい場合は、下記requestパラメータをtrueに設定する。
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: false,
      // このプロパティは、10より古いバージョンのiOSにのみ適用される。
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final macOSInitializationSettings = DarwinInitializationSettings(
      // initializeと同時に通知権限を要求したい場合は、下記requestパラメータをtrueに設定する。
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: requestSoundPermission,
    );

    await _notifier.initialize(
      // アプリがフォアグラウンドにあるときにどのように表示されるかの設定
      InitializationSettings(
        android: androidInitializationSettings,
        iOS: iOSInitializationSettings,
        macOS: macOSInitializationSettings,
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
    await updatePendingNotification();
  }

  /// iOS or macOS で通知権限を取得するためのメソッド
  /// 許可を得た場合は`true`、拒否された場合は`false`を返す
  Future<bool?> requestPermissionForApple() async {
    final iosGranted = await _iosNotifier?.requestPermissions(
      sound: true,
      alert: true,
      badge: true,
    );
    if (iosGranted != null) {
      return iosGranted;
    }
    final macOSResult = await _macOSNotifier?.requestPermissions(
      sound: true,
      alert: true,
      badge: true,
    );
    if (macOSResult != null) {
      return macOSResult;
    }
    throw Exception('iOS or macOS 以外の環境では使用できません');
  }

  /// すぐに通知を表示する。
  // Future<void> show({
  //   String? title,
  //   String? body,
  // }) async {
  //   const androidNotificationDetails = AndroidNotificationDetails(
  //     'your channel id',
  //     'your channel name',
  //     channelDescription: 'your channel description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     ticker: 'ticker',
  //   );
  //   const notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);

  //   await _notifier.show(
  //     Random().nextInt(1000),
  //     title,
  //     body,
  //     notificationDetails,
  //   );
  // }

  /// 通知を指定の日時に登録する
  ///
  /// [androidChannelId]はAndroidで使用される通知のカテゴライズID.
  /// Example: com.example.app-name.category-name
  ///
  /// [androidChannelName]は通知のカテゴライズ名・端末の設定画面に表示される
  /// Example: Expiration notice
  ///
  /// [androidChannelDescription]は通知カテゴライズの説明・端末の設定画面に表示される
  ///
  /// [appleGroupingId]はiOSとmacOSで通知をグループ化するために使用できるスレッド識別子
  /// iOS 10以上、macOS 10.14以降でのみ適用される。
  Future<void> schedule({
    required int id,
    String? title,
    String? body,
    required Duration duration,
    String? payload,
    required String androidChannelId,
    required String androidChannelName,
    String? androidChannelDescription,
    String? appleGroupingId,
  }) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
      channelDescription: androidChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
    );
    final iosNotificationDetails = DarwinNotificationDetails(
      threadIdentifier: appleGroupingId,
    );
    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await _notifier.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      notificationDetails,
      // 10より古いiOSバージョンのための指定
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      // デバイスが低電力アイドル モードに入った場合でも、正確な時刻に表示されるように指定
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
    await updatePendingNotification();
  }

  Future<void> updatePendingNotification() async {
    final notifications = await _notifier.pendingNotificationRequests();
    state = notifications;
  }

  /// [id]を指定して、単一の通知をキャンセルする。
  /// Android only: [tag]を指定すると[id]と[tag]の両方にマッチする通知をキャンセルできる。
  Future<void> cancel(int id, {String? tag}) async {
    await _notifier.cancel(id, tag: tag);
    await updatePendingNotification();
  }

  /// 全ての通知をキャンセルする。
  Future<void> cancelAll() async {
    await _notifier.cancelAll();
    state = [];
  }

  /// アプリ起動に使用された通知を取得する。
  /// 通知によってアプリが起動されていない場合はnullを返す。
  /// macOS 10.14未満ではnullが返却される。
  Future<NotificationResponse?> getNotificationAppLaunchDetails() async {
    final details = await _notifier.getNotificationAppLaunchDetails();
    if (details == null || details.didNotificationLaunchApp) {
      return null;
    }
    await updatePendingNotification();
    return details.notificationResponse;
  }

  /// 保留中の通知リクエストに[idNumber]が含まれるか調べる
  bool containsNotification(int idNumber) {
    return state.any((e) => e.id == idNumber);
  }

  /// Foregroundで通知タップした時のハンドリング
  Future<void> onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await updatePendingNotification();
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  /// Backgroundで通知をタップしてアプリを起動した場合のハンドリング
  /// Dart コンパイラで除去されないように @pragma('vm:entry-point') を指定。
  @pragma('vm:entry-point')
  static Future<void> onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload;
    if (payload != null) {
      debugPrint('通知がタップされました。payload: $payload');
      // Payload文字列からNotificationPayloadに変換
      // final jsonMap = jsonDecode(payload) as Map<String, dynamic>;
      // final notificationPayload = NotificationPayload.fromJson(jsonMap);
    }
  }
}
