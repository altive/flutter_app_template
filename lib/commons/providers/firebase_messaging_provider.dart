import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseMessagingProvider = Provider((ref) => FirebaseMessaging.instance);
