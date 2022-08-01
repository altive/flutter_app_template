import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod/riverpod.dart';

final firebaseMessagingProvider = Provider((_) => FirebaseMessaging.instance);
