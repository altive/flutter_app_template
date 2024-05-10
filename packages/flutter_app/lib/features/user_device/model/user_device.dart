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
sealed class UserDevice {
  const UserDevice();

  String get name;
  String get model;
  String get osVersionString;
}

class AndroidDevice extends UserDevice {
  const AndroidDevice({
    required this.name,
    required this.model,
    required this.osName,
    required this.osVersionString,
  });

  @override
  final String name;
  @override
  final String model;
  final String osName;
  @override
  final String osVersionString;
}

class IOSDevice extends UserDevice {
  const IOSDevice({
    required this.name,
    required this.model,
    required this.osName,
    required this.osVersionString,
  });

  @override
  final String name;
  @override
  final String model;
  final String osName;
  @override
  final String osVersionString;
}

class MacosDevice extends UserDevice {
  const MacosDevice({
    required this.name,
    required this.model,
    required this.osVersionString,
  });

  /// Altive's MacBook Air
  @override
  final String name;

  /// example: Mac14,2
  @override
  final String model;

  /// example: Version 14.2.1 (Build 23C71)
  @override
  final String osVersionString;
}

class WebDevice extends UserDevice {
  const WebDevice({
    required this.name,
    required this.model,
    required this.osVersionString,
  });

  @override
  final String name;
  @override
  final String model;
  @override
  final String osVersionString;
}
