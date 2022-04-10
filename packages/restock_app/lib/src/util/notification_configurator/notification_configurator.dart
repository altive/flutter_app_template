import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 通知の設定を担う
final notificationConfiguratorProvider =
    StateNotifierProvider<NotificationConfigurator, NotificationSettings>(
  (ref) => throw UnimplementedError(),
);

/// 通知の設定を担当する。[state]にを通知設定状態を持つ
class NotificationConfigurator extends StateNotifier<NotificationSettings> {
  NotificationConfigurator(
    this._messaging, {
    required NotificationSettings initialSettings,
  }) : super(initialSettings);

  final FirebaseMessaging _messaging;

  /// iOS向けに通知権限を取得を試みて設定を記憶する。
  /// Androidの場合は現在の通知設定状態を記憶する。
  Future<void> requestPermission() async {
    state = await _messaging.requestPermission();
  }
}

extension NotificationSettingsExt on NotificationSettings {
  bool get isAuthorized =>
      authorizationStatus == AuthorizationStatus.authorized;
  bool get isNotAuthorized => !isAuthorized;
}
