import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_messaging_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseMessaging firebaseMessaging(FirebaseMessagingRef ref) =>
    FirebaseMessaging.instance;
