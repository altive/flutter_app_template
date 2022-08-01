import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:notification_receiver/notification_receiver.dart';
import 'package:notification_receiver/src/firebase_messaging_provider.dart';
import 'package:riverpod/riverpod.dart';

import 'notification_settings_provider_test.mocks.dart';

@GenerateMocks([FirebaseMessaging])
void main() {
  group('notificationSettingsProvider', () {
    test(
      'The state immediately after generation is AsyncLoading.',
      () {
        final container = ProviderContainer(
          overrides: [
            firebaseMessagingProvider
                .overrideWithValue(MockFirebaseMessaging()),
          ],
        );
        addTearDown(container.dispose);

        // when
        final state = container.read(notificationSettingsProvider);

        // then
        expect(state, const AsyncLoading<NotificationSettings>());
      },
    );
  });
}
