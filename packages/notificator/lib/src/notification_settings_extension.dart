import 'package:firebase_messaging/firebase_messaging.dart';

extension NotificationSettingsExt on NotificationSettings {
  bool get isAuthorized =>
      authorizationStatus == AuthorizationStatus.authorized;
  bool get isNotAuthorized => !isAuthorized;
}
