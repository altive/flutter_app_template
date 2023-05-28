import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_provider.g.dart';

/// Provide Firebase Remote Config default instance.
@Riverpod(keepAlive: true)
FirebaseRemoteConfig remoteConfig(RemoteConfigRef ref) {
  return FirebaseRemoteConfig.instance;
}
