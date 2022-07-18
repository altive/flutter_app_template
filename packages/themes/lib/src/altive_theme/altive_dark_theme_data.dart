import 'package:flutter/material.dart';

import 'button_theme_data.dart';
import 'text_theme.dart';
import 'theme_description.dart';

final _defaultThemeData = ThemeData.dark();
const _colorScheme = ColorScheme.dark();

ThemeData get altiveDarkThemeData {
  return _defaultThemeData.copyWith(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: _defaultThemeData.textTheme.merge(textTheme),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    extensions: [
      ThemeDescription(
        title: 'Dark',
        subtitle: 'Dark theme',
        icon: const Icon(Icons.nightlife, color: Colors.red),
      ),
    ],
  );
}
