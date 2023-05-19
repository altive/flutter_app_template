import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/user_device.dart';

part 'user_device_provider.g.dart';

/// UserDevice can be an AndroidDevice, IosDevice, or MacosDevice...
@Riverpod(keepAlive: true)
UserDevice userDevice(UserDeviceRef ref) {
  throw UnimplementedError();
}
