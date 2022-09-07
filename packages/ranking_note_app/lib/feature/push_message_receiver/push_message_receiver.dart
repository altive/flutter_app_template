import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commons/providers/firebase_messaging_provider.dart';
import '../../commons/providers/firestore_provider.dart';
import '../../commons/providers/navigator_key_provider.dart';

final pushMessageReceiverProvider = Provider<PushMessageReceiver>((ref) {
  return PushMessageReceiver(ref.read);
});

class PushMessageReceiver {
  PushMessageReceiver(this._read) {
    // Subscribe to the latest FCM Token.
    // The FCM Token will be updated when the app is installed, the device is
    // changed, the app is reinstalled, or the app's data is deleted.
    // TODO(Riscait): cancel on dispose.
    _messaging.onTokenRefresh.listen(saveLatestToken);
    // Foreground messages.
    // TODO(Riscait): cancel on dispose.
    FirebaseMessaging.onMessage.listen(handleMessage);
  }

  final Reader _read;
  late final _messaging = _read(firebaseMessagingProvider);

  /// Save the FCM Token in Firestore.
  Future<void> saveLatestToken(String token) async {
    _read(firestoreProvider);
  }

  /// Foreground messages.
  Future<void> handleMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      ScaffoldMessenger.of(_read(navigatorKeyProvider).currentContext!)
          .showSnackBar(
        SnackBar(
          content: Text('${notification.title ?? ''} ${notification.body}'),
        ),
      );
    }
  }

  /// Read the current permissions without attempting to request
  /// On Android authorizationStatus is always authorized.
  Future<NotificationSettings> getCurrentSettings() async {
    final settings = await _messaging.getNotificationSettings();
    return settings;
  }

  /// If the user declines the request, you cannot re-request permission.
  /// On Android authorizationStatus is always authorized.
  Future<void> requestPermission() async {
    final settings = await _messaging.requestPermission();
    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        // The user granted permission.
        break;
      case AuthorizationStatus.denied:
        // The user denied permission.
        break;
      case AuthorizationStatus.notDetermined:
        // The user has not yet chosen whether to grant permission.
        break;
      case AuthorizationStatus.provisional:
        // The user granted provisional permission.
        break;
    }
  }

  /// FCM Token.
  Future<String> web() async {
    final token = await _messaging.getToken(
      vapidKey:
          '''BIDJgmXPe0BrpfTOwKeBB9W6kGMDEeTjyIXLoXHQlGQrMYTjTWlJuL04rYv5HzKFsIGQsplZ2_Gz56OnKdxHNDc''',
    );
    return token!;
  }
}
