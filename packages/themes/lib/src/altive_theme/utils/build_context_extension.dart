import 'package:flutter/material.dart';

import '../theme_extensions/theme_extensions.dart';

/// Extension of BuildContext for Theme.
extension BuildContextWithThemeExtension on BuildContext {
  /// Get the closest [TextTheme] instance via [BuildContext].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the closest [ColorScheme] instance via [BuildContext].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the closest [ThemeDescription] instance via [BuildContext].
  ThemeDescription get themeDescription => Theme.of(this).extension()!;
}
