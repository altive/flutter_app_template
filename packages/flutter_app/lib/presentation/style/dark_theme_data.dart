import 'package:flutter/material.dart';

import 'button_theme_data.dart';
import 'text_theme.dart';

final _defaultThemeData = ThemeData.dark();
const _colorScheme = ColorScheme.dark();

ThemeData get darkThemeData {
  return _defaultThemeData.copyWith(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: _defaultThemeData.textTheme.merge(textTheme),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
  );
}
