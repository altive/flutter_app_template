import 'package:flutter/material.dart';

import 'button_theme_data.dart';
import 'text_theme.dart';

final _defaultThemeData = ThemeData.light();
const _colorScheme = ColorScheme.light();

ThemeData get lightThemeData {
  return _defaultThemeData.copyWith(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: _defaultThemeData.textTheme.merge(textTheme),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
  );
}
