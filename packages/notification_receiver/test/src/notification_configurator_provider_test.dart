import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notification_receiver/notification_receiver.dart';
import 'package:notification_receiver/src/firebase_messaging_provider.dart';
import 'package:riverpod/riverpod.dart';

import 'notification_configurator_provider_test.mocks.dart';

@GenerateMocks([FirebaseMessaging])
void main() {
  group('notificationConfiguratorProvider', () {
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
          (_) async => _notificationSettings00,
        );

        // when
        final state = container.read(notificationConfiguratorProvider);

        // then
        expect(state, const AsyncLoading<NotificationSettings>());
      },
    );
  });

  group('NotificationConfigurator', () {
    group('#requestPermission', () {
      test(
        'The state of the method is changed according to '
        'the return value when the method is executed.',
        () async {
          // mock
          final firebaseMessaging = MockFirebaseMessaging();
          final container = _createContainer(messaging: firebaseMessaging);

          when(firebaseMessaging.getNotificationSettings()).thenAnswer(
            (_) async => _notificationSettings00,
          );

          when(firebaseMessaging.requestPermission()).thenAnswer(
            (_) async => _notificationSettings01,
          );

          final configurator =
              container.read(notificationConfiguratorProvider.notifier);

          // given
          expect(
            container.read(notificationConfiguratorProvider),
            const AsyncLoading<NotificationSettings>(),
          );

          // when
          await configurator.requestPermission();

          // then
          verify(firebaseMessaging.getNotificationSettings()).called(1);
          verify(firebaseMessaging.requestPermission()).called(1);
          expect(
            container.read(notificationConfiguratorProvider),
            const AsyncData(_notificationSettings01),
          );
        },
      );
    });

    group('#refetch', () {
      test(
        'The state of the method is changed according to '
        'the return value when the method is executed.',
        () async {
          // mock
          final firebaseMessaging = MockFirebaseMessaging();
          final container = _createContainer(messaging: firebaseMessaging);

          when(firebaseMessaging.getNotificationSettings()).thenAnswer(
            (_) async => _notificationSettings00,
          );

          when(firebaseMessaging.getNotificationSettings()).thenAnswer(
            (_) async => _notificationSettings01,
          );

          final configurator =
              container.read(notificationConfiguratorProvider.notifier);

          // given
          expect(
            container.read(notificationConfiguratorProvider),
            const AsyncLoading<NotificationSettings>(),
          );

          when(firebaseMessaging.getNotificationSettings()).thenAnswer(
            (_) async => _notificationSettings02,
          );

          // when
          await configurator.refetchSettings();

          // then
          verify(firebaseMessaging.getNotificationSettings()).called(2);
          expect(
            container.read(notificationConfiguratorProvider),
            const AsyncData(_notificationSettings02),
          );
        },
      );
    });
  });
}

ProviderContainer _createContainer({
  FirebaseMessaging? messaging,
}) {
  final container = ProviderContainer(
    overrides: [
      firebaseMessagingProvider.overrideWithValue(
        messaging ?? MockFirebaseMessaging(),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

const _notificationSettings00 = NotificationSettings(
  alert: AppleNotificationSetting.enabled,
  announcement: AppleNotificationSetting.enabled,
  authorizationStatus: AuthorizationStatus.denied,
  badge: AppleNotificationSetting.enabled,
  carPlay: AppleNotificationSetting.enabled,
  lockScreen: AppleNotificationSetting.enabled,
  notificationCenter: AppleNotificationSetting.enabled,
  showPreviews: AppleShowPreviewSetting.never,
  timeSensitive: AppleNotificationSetting.enabled,
  sound: AppleNotificationSetting.enabled,
  criticalAlert: AppleNotificationSetting.enabled,
);

const _notificationSettings01 = NotificationSettings(
  alert: AppleNotificationSetting.disabled,
  announcement: AppleNotificationSetting.disabled,
  authorizationStatus: AuthorizationStatus.denied,
  badge: AppleNotificationSetting.disabled,
  carPlay: AppleNotificationSetting.disabled,
  lockScreen: AppleNotificationSetting.disabled,
  notificationCenter: AppleNotificationSetting.disabled,
  showPreviews: AppleShowPreviewSetting.never,
  timeSensitive: AppleNotificationSetting.disabled,
  sound: AppleNotificationSetting.disabled,
  criticalAlert: AppleNotificationSetting.disabled,
);

const _notificationSettings02 = NotificationSettings(
  alert: AppleNotificationSetting.enabled,
  announcement: AppleNotificationSetting.enabled,
  authorizationStatus: AuthorizationStatus.authorized,
  badge: AppleNotificationSetting.enabled,
  carPlay: AppleNotificationSetting.enabled,
  lockScreen: AppleNotificationSetting.enabled,
  notificationCenter: AppleNotificationSetting.enabled,
  showPreviews: AppleShowPreviewSetting.always,
  timeSensitive: AppleNotificationSetting.enabled,
  sound: AppleNotificationSetting.enabled,
  criticalAlert: AppleNotificationSetting.disabled,
);
