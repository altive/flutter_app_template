import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod/riverpod.dart';

import 'notification_configurator.dart';

/// 通知の設定を担う
final notificationSettingsProvider =
    AsyncNotifierProvider<NotificationConfigurator, NotificationSettings>(
  NotificationConfigurator.new,
);
