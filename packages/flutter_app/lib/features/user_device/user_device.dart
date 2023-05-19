import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'model/user_device.dart';

export 'model/user_device.dart';
export 'user_device_provider.dart';

Future<UserDevice> retrieveUserDevice() async {
  final deviceInfoPlugin = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final info = await deviceInfoPlugin.androidInfo;
    return UserDevice.android(
      name: '${info.manufacturer} ${info.model}',
      model: info.model,
      osName: info.version.codename,
      osVersionString: info.version.release,
    );
  }

  if (Platform.isIOS) {
    final info = await deviceInfoPlugin.iosInfo;
    return UserDevice.ios(
      name: info.utsname.machine,
      model: info.model,
      osName: info.systemName,
      osVersionString: info.systemVersion,
    );
  }

  if (Platform.isMacOS) {
    final info = await deviceInfoPlugin.macOsInfo;
    return UserDevice.macos(
      name: info.computerName,
      model: info.model,
      osName: info.osRelease,
      osVersionString: info.kernelVersion,
    );
  }
  throw UnimplementedError('Unsupported platform');
}
