import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version/version.dart';

part 'user_device.freezed.dart';

/// ユーザーの使用している実行デバイスの情報。
///
/// ```dart
/// UserDevice device;
/// device.name;
///
/// device.when(...);
///
/// if (device is AndroidDevice) {}
/// ```
@freezed
sealed class UserDevice with _$UserDevice {
  const factory UserDevice.android({
    required String name,
    required String model,
    required String osName,
    required String osVersionString,
  }) = AndroidDevice;

  const factory UserDevice.ios({
    required String name,
    required String model,
    required String osName,
    required String osVersionString,
  }) = IosDevice;

  const factory UserDevice.macos({
    required String name,
    required String model,
    required String osName,
    required String osVersionString,
  }) = MacosDevice;

  const UserDevice._();

  Version get osVersion => Version.parse(osVersionString);
}
