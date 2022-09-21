import 'package:riverpod/riverpod.dart';

import '../notification_sender.dart';

final notificationSenderProvider =
    StateNotifierProvider<NotificationSender, List<PendingNotificationRequest>>(
  (ref) => NotificationSender(),
);
