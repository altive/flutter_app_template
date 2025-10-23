import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

/// A class that wraps package for sending notifications and messages.
/// Its role is to "send necessary notifications and messages to the user".
///
/// It exposes methods for sending and receiving notifications, displaying
/// in-app messages, and managing settings related to these functions.
class Messenger {
  /// Creates a new instance of Messenger.
  Messenger({
    FirebaseMessaging? messaging,
    FlutterLocalNotificationsPlugin? notifications,
  }) : _messaging = messaging ?? FirebaseMessaging.instance,
       _notifications = notifications ?? FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _messaging;

  final FlutterLocalNotificationsPlugin _notifications;

  /// Requests notification permissions.
  ///
  /// On iOS, sets the foreground notification presentation options using
  /// [alert], [badge], and [sound], determining how notification appear
  /// when the app is in the foreground.
  Future<NotificationSettings> requestPermission({
    bool alert = false,
    bool badge = false,
    bool sound = false,
  }) async {
    // Foreground notification presentation options for iOS.
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: alert,
      badge: badge,
      sound: sound,
    );
    final settings = await _messaging.requestPermission();
    return settings;
  }

  /// Returns the current notification settings.
  Future<NotificationSettings> getNotificationSettings() {
    return _messaging.getNotificationSettings();
  }

  /// Receives messages when the app is in the foreground.
  ///
  /// Listens to incoming messages and triggers the callback with new data.
  void onForegroundMessage(ValueChanged<RemoteMessage> onData) {
    FirebaseMessaging.onMessage.listen(onData);
  }

  /// Activated when a message is tapped and the app is opened.
  ///
  /// This listener handles the event when the app is brought to foreground
  /// via a notification tap.
  void onMessageOpenedApp(ValueChanged<RemoteMessage> onData) {
    FirebaseMessaging.onMessageOpenedApp.listen(onData);
  }

  /// Handles receiving messages when the app is in the background.
  ///
  /// Must provide a function to process the message data.
  ///
  /// Set a message handler function which is called when the app is in the
  /// background or terminated.
  /// This provided handler must be a top-level function and cannot be anonymous
  /// otherwise an [ArgumentError] will be thrown.

  void onBackgroundMessage(
    Future<void> Function(RemoteMessage message) handler,
  ) {
    FirebaseMessaging.onBackgroundMessage(handler);
  }

  /// Returns the initial message when the app is opened
  /// from a terminated state.
  ///
  /// This is useful for handling messages that were received
  /// while the app was closed.
  Future<RemoteMessage?> getInitialMessage() {
    return _messaging.getInitialMessage();
  }

  /// Returns the latest FCM token that can be used
  /// for device specific messages.
  Future<String?> getToken() {
    return _messaging.getToken();
  }

  /// Listens for token updates and triggers the callback with the new token.
  ///
  /// This is important for maintaining a current token for receiving messages.
  /// Returns a StreamSubscription that can be cancelled.
  StreamSubscription<String> onTokenRefresh(ValueChanged<String> onData) {
    return _messaging.onTokenRefresh.listen(onData);
  }

  /// Subscribes the device to a specific topic for grouped messages.
  Future<void> subscribeToTopic(String topic) {
    return _messaging.subscribeToTopic(topic);
  }

  /// Initializes local notifications settings for Android and iOS.
  ///
  /// Parameters allow for setting default icon and request permissions.
  /// Callbacks can be set for handling notification taps.
  Future<void> initializeNotifications({
    required String androidDefaultIcon,
    bool requestAlertPermission = false,
    bool requestBadgePermission = false,
    bool requestSoundPermission = false,
    void Function(int, String?, String?, String?)?
    onDidReceiveLocalNotification,
    ValueChanged<Map<String, Object?>>? onNotificationTapped,
  }) async {
    tz.initializeTimeZones();

    final androidInitializationSettings = AndroidInitializationSettings(
      androidDefaultIcon,
    );

    final iOSInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: requestSoundPermission,
    );

    final macOSInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: requestSoundPermission,
    );

    await _notifications.initialize(
      // Settings for how the app appears when it is in the foreground
      InitializationSettings(
        android: androidInitializationSettings,
        iOS: iOSInitializationSettings,
        macOS: macOSInitializationSettings,
      ),
      onDidReceiveNotificationResponse: (response) async {
        await onForegroundNotificationTapped(
          notificationResponse: response,
          onNotificationTapped: onNotificationTapped,
        );
      },
    );
  }

  /// Executes when a notification is tapped while the app is in the foreground.
  ///
  /// Parses the payload to JSON and triggers the provided
  /// callback with the data.
  @visibleForTesting
  Future<void> onForegroundNotificationTapped({
    required NotificationResponse notificationResponse,
    ValueChanged<Map<String, Object?>>? onNotificationTapped,
  }) async {
    final payload = notificationResponse.payload;
    debugPrint('Notification tapped in foreground. payload: $payload');
    if (payload != null && onNotificationTapped != null) {
      final jsonMap = jsonDecode(payload) as Map<String, dynamic>;
      onNotificationTapped(jsonMap);
    }
  }

  /// Displays a notification with customizable settings.
  ///
  /// Can specify the notification channel, description, icon,
  /// and color among others.
  Future<void> showNotification({
    required String channelId,
    required String channelName,
    required String channelDescription,
    required String icon,
    required Color color,
    required int id,
    String? title,
    String? body,
    Map<String, dynamic>? payloadJsonMap,
  }) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      icon: icon,
      importance: Importance.max,
      priority: Priority.high,
      color: color,
    );

    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    const macOSPlatformChannelSpecifics = DarwinNotificationDetails();

    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
      macOS: macOSPlatformChannelSpecifics,
    );

    await _notifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: jsonEncode(payloadJsonMap),
    );
  }

  /// Retrieves a list of active local notifications.
  Future<List<ActiveNotification>> getActiveNotifications() async {
    return _notifications.getActiveNotifications();
  }

  /// Retrieves a list of scheduled local notifications.
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return _notifications.pendingNotificationRequests();
  }

  /// Cancels a local notification with the specified ID.
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// Cancels all local notifications.
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}
