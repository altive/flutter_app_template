import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod/riverpod.dart';

/// 通知の設定を担当する。[state]にを通知設定状態を持つ
class NotificationConfigurator
    extends StateNotifier<AsyncValue<NotificationSettings>> {
  NotificationConfigurator({
    required FirebaseMessaging messaging,
  })  : _messaging = messaging,
        super(const AsyncLoading()) {
    _fetchSettings();
  }

  final FirebaseMessaging _messaging;

  /// [NotificationSettings]を取得して[state]を更新する
  Future<void> _fetchSettings() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _messaging.getNotificationSettings();
    });
  }

  /// [NotificationSettings]を再取得して[state]を更新する
  Future<void> refetchSettings() async {
    await _fetchSettings();
  }

  /// iOS向けに通知権限を取得を試みて設定を記憶する。
  /// Androidの場合は現在の通知設定状態を記憶する。
  Future<void> requestPermission() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _messaging.requestPermission();
    });
  }
}
