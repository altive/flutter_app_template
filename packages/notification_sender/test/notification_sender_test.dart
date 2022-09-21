import 'package:flutter_test/flutter_test.dart';
import 'package:notification_sender/notification_sender.dart';

void main() {
  test(
      'notification_sender/notification_sender.dartのインポートでNotificationSenderが使用できること',
      () {
    expect(NotificationSender.new, returnsNormally);
  });
}
