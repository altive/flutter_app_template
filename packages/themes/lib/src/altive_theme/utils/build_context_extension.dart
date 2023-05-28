import 'package:flutter/material.dart';

import '../theme_extensions/theme_extensions.dart';

extension BuildContextWithThemeExtension on BuildContext {
  /// [BuildContext] 経由で、最も近い [ThemeDescription] インスタンスを取得する
  ThemeDescription get themeDescription => Theme.of(this).extension()!;

  /// [BuildContext] 経由で、最も近い [TextTheme] インスタンスを取得する
  TextTheme get textTheme => Theme.of(this).textTheme;
}
