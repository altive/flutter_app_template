import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'remote_config_service.dart';

final remoteConfigProvider = FutureProvider<RemoteConfigService?>((ref) async {
  return RemoteConfigService.getInstance();
});
