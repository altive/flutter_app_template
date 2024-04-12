import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/user_device.dart';

part 'user_device_provider.g.dart';

/// Providers that need to initialize asynchronously only once at startup.
@Riverpod(keepAlive: true)
Future<UserDevice> userDeviceInitializing(UserDeviceInitializingRef ref) async {
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
      osVersionString: info.osRelease,
    );
  }
  throw UnimplementedError('Unsupported platform');
}

/// Provide information on devices used by users.
///
/// After initialization, use this, which can be obtained synchronously.
@Riverpod(keepAlive: true)
UserDevice userDevice(UserDeviceRef ref) =>
    ref.watch(userDeviceInitializingProvider).requireValue;
