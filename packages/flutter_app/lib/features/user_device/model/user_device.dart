import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    /// Altive's MacBook Air
    required String name,

    /// example: Mac14,2
    required String model,

    /// example: Version 14.2.1 (Build 23C71)
    required String osVersionString,
  }) = MacosDevice;

  const UserDevice._();
}
