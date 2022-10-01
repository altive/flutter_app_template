import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notification_receiver/notification_receiver.dart';
import 'package:notification_receiver/src/firebase_messaging_provider.dart';
import 'package:riverpod/riverpod.dart';

import 'notification_settings_provider_test.mocks.dart';

@GenerateMocks([FirebaseMessaging])
void main() {
  group('notificationSettingsProvider', () {
    test(
      'The state immediately after generation is AsyncLoading.',
      () async {
        final firebaseMessaging = MockFirebaseMessaging();

        final container = ProviderContainer(
          overrides: [
            firebaseMessagingProvider.overrideWithValue(firebaseMessaging),
          ],
        );
        addTearDown(container.dispose);

        when(firebaseMessaging.getNotificationSettings()).thenAnswer(
          (_) async => _settings,
        );

        // when
        final state = container.read(notificationSettingsProvider);

        // then
        expect(state, const AsyncLoading<NotificationSettings>());
      },
    );
  });
}

const _settings = NotificationSettings(
  alert: AppleNotificationSetting.enabled,
  announcement: AppleNotificationSetting.enabled,
  authorizationStatus: AuthorizationStatus.authorized,
  badge: AppleNotificationSetting.enabled,
  carPlay: AppleNotificationSetting.enabled,
  lockScreen: AppleNotificationSetting.enabled,
  notificationCenter: AppleNotificationSetting.enabled,
  showPreviews: AppleShowPreviewSetting.always,
  timeSensitive: AppleNotificationSetting.enabled,
  criticalAlert: AppleNotificationSetting.enabled,
  sound: AppleNotificationSetting.enabled,
);
