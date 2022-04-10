import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 現在のビルドモードを提供する
final buildModeProvider = Provider((ref) => _buildMode);

enum BuildMode {
  debug,
  profile,
  release,
}

extension BuildModeExt on BuildMode {
  bool get isDebug => this == BuildMode.debug;
  bool get isRelease => this == BuildMode.release;
}

/// 現在のビルドモードを取得する
BuildMode get _buildMode {
  if (const bool.fromEnvironment('dart.vm.product')) {
    return BuildMode.release;
  }
  var result = BuildMode.profile;
  assert(
    () {
      result = BuildMode.debug;
      return true;
    }(),
  );
  return result;
}
