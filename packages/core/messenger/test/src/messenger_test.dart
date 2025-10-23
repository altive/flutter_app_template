import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/messenger.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockNotificationSettings extends Mock implements NotificationSettings {}

class MockRemoteMessage extends Mock implements RemoteMessage {}

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

class MockNotificationResponse extends Mock implements NotificationResponse {}

void main() {
  group('Messenger', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseCoreMocks();

      // Mock Firebase Messaging MethodChannel
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/firebase_messaging'),
            (MethodCall methodCall) async {
              switch (methodCall.method) {
                case 'Messaging#getInitialMessage':
                  return null;
                case 'Messaging#getToken':
                  return 'test-token';
                case 'Messaging#requestPermission':
                  return {
                    'authorizationStatus': 1,
                    'showPreviews': true,
                    'sound': true,
                    'badge': true,
                    'alert': true,
                  };
                case 'Messaging#setBackgroundMessageHandler':
                  return true;
                case 'Messaging#registerBackgroundMessageHandler':
                  return true;
                default:
                  return null;
              }
            },
          );

      registerFallbackValue(
        const InitializationSettings(
          android: AndroidInitializationSettings(''),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
      );

      // Initialize Firebase after setting up mocks
      await Firebase.initializeApp();
    });

    test('requestPermission should call '
        'setForegroundNotificationPresentationOptions'
        'and requestPermission on messaging', () async {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);
      final settings = MockNotificationSettings();

      when(
        () => messaging.setForegroundNotificationPresentationOptions(
          alert: any(named: 'alert'),
          badge: any(named: 'badge'),
          sound: any(named: 'sound'),
        ),
      ).thenAnswer((_) async {});
      when(messaging.requestPermission).thenAnswer((_) async => settings);

      final result = await messenger.requestPermission();

      expect(result, settings);

      verify(
        () => messaging.setForegroundNotificationPresentationOptions(
          alert: any(named: 'alert'),
          badge: any(named: 'badge'),
          sound: any(named: 'sound'),
        ),
      ).called(1);
      verify(messaging.requestPermission).called(1);
    });

    test('getNotificationSettings should call '
        'getNotificationSettings on messaging', () async {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);
      final settings = MockNotificationSettings();

      when(messaging.getNotificationSettings).thenAnswer((_) async => settings);

      final result = await messenger.getNotificationSettings();

      expect(result, settings);

      verify(messaging.getNotificationSettings).called(1);
    });

    test('onForegroundMessage should set up listener without throwing', () {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);
      var callbackCalled = false;

      expect(
        () => messenger.onForegroundMessage((message) {
          callbackCalled = true;
        }),
        returnsNormally,
      );

      expect(callbackCalled, isFalse);
    });

    test('onMessageOpenedApp should set up listener without throwing', () {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);
      var callbackCalled = false;

      expect(
        () => messenger.onMessageOpenedApp((message) {
          callbackCalled = true;
        }),
        returnsNormally,
      );

      expect(callbackCalled, isFalse);
    });

    test('onBackgroundMessage should accept handler function', () {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);

      expect(
        messenger.onBackgroundMessage,
        isA<void Function(Future<void> Function(RemoteMessage))>(),
      );
    });

    test(
      'getInitialMessage should call getInitialMessage on messaging',
      () async {
        final messaging = MockFirebaseMessaging();
        final messenger = Messenger(messaging: messaging);
        final message = MockRemoteMessage();

        when(messaging.getInitialMessage).thenAnswer((_) async => message);

        final result = await messenger.getInitialMessage();

        expect(result, message);

        verify(messaging.getInitialMessage).called(1);
      },
    );

    test('getToken should call getToken on messaging', () async {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);
      const token = 'test_token';

      when(messaging.getToken).thenAnswer((_) async => token);

      final result = await messenger.getToken();

      expect(result, token);

      verify(messaging.getToken).called(1);
    });

    test('onTokenRefresh should set up listener without throwing', () {
      final messaging = MockFirebaseMessaging();
      final messenger = Messenger(messaging: messaging);
      var callbackCalled = false;

      // Mock the onTokenRefresh stream
      when(() => messaging.onTokenRefresh).thenAnswer(
        (_) => const Stream<String>.empty(),
      );

      expect(
        () => messenger.onTokenRefresh((token) {
          callbackCalled = true;
        }),
        returnsNormally,
      );

      expect(callbackCalled, isFalse);
    });

    test(
      'subscribeToTopic should call subscribeToTopic on messaging',
      () async {
        final messaging = MockFirebaseMessaging();
        final messenger = Messenger(messaging: messaging);
        const topic = 'test_topic';

        when(() => messaging.subscribeToTopic(any())).thenAnswer((_) async {});

        await messenger.subscribeToTopic(topic);

        verify(() => messaging.subscribeToTopic(topic)).called(1);
      },
    );

    test(
      'initializeNotifications should initialize notifications correctly',
      () async {
        final messaging = MockFirebaseMessaging();
        final notifications = MockFlutterLocalNotificationsPlugin();
        final messenger = Messenger(
          messaging: messaging,
          notifications: notifications,
        );

        when(
          () => notifications.initialize(
            any(),
            onDidReceiveNotificationResponse: any(
              named: 'onDidReceiveNotificationResponse',
            ),
          ),
        ).thenAnswer((_) async => true);

        await messenger.initializeNotifications(
          androidDefaultIcon: 'test_icon',
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

        verify(
          () => notifications.initialize(
            any(
              that: predicate(
                (InitializationSettings settings) {
                  final iosSettings = settings.iOS;
                  if (iosSettings == null) {
                    return false;
                  }
                  return settings.android?.defaultIcon == 'test_icon' &&
                      iosSettings.requestAlertPermission &&
                      iosSettings.requestBadgePermission &&
                      iosSettings.requestSoundPermission;
                },
              ),
            ),
            onDidReceiveNotificationResponse: any(
              named: 'onDidReceiveNotificationResponse',
            ),
          ),
        ).called(1);
      },
    );

    test(
      'onForegroundNotificationTapped should handle payload correctly',
      () async {
        final messaging = MockFirebaseMessaging();
        final notifications = MockFlutterLocalNotificationsPlugin();
        final messenger = Messenger(
          messaging: messaging,
          notifications: notifications,
        );
        final mockResponse = MockNotificationResponse();
        const mockPayload = '{"key": "value"}';

        when(() => mockResponse.payload).thenReturn(mockPayload);

        final completer = Completer<Map<String, dynamic>>();

        await messenger.onForegroundNotificationTapped(
          notificationResponse: mockResponse,
          onNotificationTapped: completer.complete,
        );

        final result = await completer.future;
        expect(result, {'key': 'value'});
      },
    );

    test('showNotification should call show on notifications', () async {
      final messaging = MockFirebaseMessaging();
      final notifications = MockFlutterLocalNotificationsPlugin();
      final messenger = Messenger(
        messaging: messaging,
        notifications: notifications,
      );

      when(
        () => notifications.show(
          any(),
          any(),
          any(),
          any(),
          payload: any(named: 'payload'),
        ),
      ).thenAnswer((_) async {});

      await messenger.showNotification(
        channelId: 'test_channel',
        channelName: 'Test Channel',
        channelDescription: 'Test Description',
        icon: 'test_icon',
        // For testing purposes, we use a hardcoded color.
        // ignore: avoid_hardcoded_color
        color: const Color(0xFF000000),
        id: 1,
        title: 'Test Title',
        body: 'Test Body',
        payloadJsonMap: {'key': 'value'},
      );

      verify(
        () => notifications.show(
          1,
          'Test Title',
          'Test Body',
          any(),
          payload: any(named: 'payload'),
        ),
      ).called(1);
    });
  });
}
