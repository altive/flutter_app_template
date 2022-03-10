import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'notification_controller.dart';

export 'notification_controller.dart';
export 'notification_date.dart';
export 'notification_payload.dart';

final notificationControllerProvider =
    StateNotifierProvider<NotificationController, List<int>>((ref) {
  return NotificationController(ref.read);
});
