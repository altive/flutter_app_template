import 'package:flutter/material.dart';

import 'button_theme_data.dart';
import 'text_theme.dart';
import 'theme_description.dart';

final _defaultThemeData = ThemeData.light();
const _colorScheme = ColorScheme.light();

ThemeData get altiveLightThemeData {
  return _defaultThemeData.copyWith(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: _defaultThemeData.textTheme.merge(textTheme),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    extensions: [
      ThemeDescription(
        title: 'Light',
        subtitle: 'Light theme',
        icon: const Icon(Icons.wb_sunny, color: Colors.orange),
      ),
    ],
  );
}
