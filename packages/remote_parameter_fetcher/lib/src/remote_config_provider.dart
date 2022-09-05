import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod/riverpod.dart';

/// Provide Firebase Remote Config default instance.
final remoteConfigProvider = Provider<FirebaseRemoteConfig>((ref) {
  return FirebaseRemoteConfig.instance;
});
