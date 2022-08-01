import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod/riverpod.dart';

import 'firebase_messaging_provider.dart';
import 'notification_configurator.dart';

/// 通知の設定を担う
final notificationSettingsProvider = StateNotifierProvider<
    NotificationConfigurator, AsyncValue<NotificationSettings>>(
  (ref) {
    final messaging = ref.watch(firebaseMessagingProvider);
    return NotificationConfigurator(messaging: messaging);
  },
);
