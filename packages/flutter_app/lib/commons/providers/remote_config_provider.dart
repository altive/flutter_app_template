import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flavor_provider.dart';

/// Firebase Remote Config Provider
final remoteConfigProvider = Provider<RemoteConfig>((ref) {
  final rc = RemoteConfig.instance;

  // 本番環境ではFetch間隔を12時間に設定、開発環境では0
  final flavor = ref.watch(flavorProvider);
  final interval =
      flavor == Flavor.prod ? const Duration(hours: 12) : Duration.zero;
  // タイムアウトとフェッチのインターバル時間を設定する
  rc.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: interval,
    ),
  );
  return rc;
});
