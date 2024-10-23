import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/user_device.dart';

part 'user_device_provider.g.dart';

/// Providers that need to initialize asynchronously only once at startup.
@Riverpod(keepAlive: true)
Future<UserDevice> userDeviceInitializing(Ref ref) async {
  final deviceInfo = DeviceInfoPlugin();

  if (kIsWeb) {
    final info = await deviceInfo.webBrowserInfo;
    return WebDevice(
      name: info.browserName.name,
      model: info.product ?? '',
      osVersionString: info.appVersion ?? '',
    );
  }

  if (Platform.isAndroid) {
    final info = await deviceInfo.androidInfo;
    return AndroidDevice(
      name: '${info.manufacturer} ${info.model}',
      model: info.model,
      osName: info.version.codename,
      osVersionString: info.version.release,
    );
  }

  if (Platform.isIOS) {
    final info = await deviceInfo.iosInfo;
    return IOSDevice(
      name: info.utsname.machine,
      model: info.model,
      osName: info.systemName,
      osVersionString: info.systemVersion,
    );
  }

  if (Platform.isMacOS) {
    final info = await deviceInfo.macOsInfo;
    return MacosDevice(
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
UserDevice userDevice(Ref ref) =>
    ref.watch(userDeviceInitializingProvider).requireValue;
