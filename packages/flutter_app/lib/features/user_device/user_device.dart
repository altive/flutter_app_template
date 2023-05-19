import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'model/user_device.dart';

export 'model/user_device.dart';
export 'user_device_provider.dart';

/// 実行デバイスのOperatingSystem。アプリが動作対象とするもののみを列挙。
enum _DeviceOs {
  android,
  ios,
  macos,
}

Future<UserDevice> retrieveUserDevice() async {
  final os = Platform.operatingSystem;
  final deviceOs = _DeviceOs.values.byName(os);

  final deviceInfoPlugin = DeviceInfoPlugin();

  switch (deviceOs) {
    case _DeviceOs.android:
      final info = await deviceInfoPlugin.androidInfo;
      return UserDevice.android(
        name: '${info.manufacturer} ${info.model}',
        model: info.model,
        osName: info.version.codename,
        osVersionString: info.version.release,
      );
    case _DeviceOs.ios:
      final info = await deviceInfoPlugin.iosInfo;
      return UserDevice.ios(
        name: info.utsname.machine,
        model: info.model,
        osName: info.systemName,
        osVersionString: info.systemVersion,
      );
    case _DeviceOs.macos:
      final info = await deviceInfoPlugin.macOsInfo;
      return UserDevice.macos(
        name: info.computerName,
        model: info.model,
        osName: info.osRelease,
        osVersionString: info.kernelVersion,
      );
  }
}
