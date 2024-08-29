import 'package:flutter/material.dart';

import 'app_text_theme.dart';
import 'light_color_scheme.dart';
import 'theme_data/theme_data.dart';
import 'theme_extensions/theme_extensions.dart';

/// Returns a [ThemeData] for light theme.
ThemeData get lightThemeData {
  final colorScheme = lightColorScheme;

  final defaultThemeData = ThemeData.light();
  final textTheme = defaultThemeData.textTheme.merge(appTextTheme);

  return defaultThemeData.copyWith(
    // 🎨 Color section
    colorScheme: colorScheme,
    // 🖋 Text theme section
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    // 🖼 ThemeData section
    appBarTheme: appBarThemeData(textTheme: textTheme),
    cardTheme: appCardThemeData,
    chipTheme: appChipThemeData(colorScheme: colorScheme),
    inputDecorationTheme: appInputDecorationTheme(colorScheme: colorScheme),
    navigationBarTheme: navigationBarThemeData(colorScheme: colorScheme),
    // Extensions
    extensions: [
      const ThemeDescription(
        title: 'Light',
        subtitle: 'Light theme',
        icon: Icon(Icons.wb_sunny, color: Colors.orange),
      ),
    ],
  );
}
