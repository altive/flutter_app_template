import 'package:flutter/material.dart';

import 'app_text_theme.dart';
import 'light_color_scheme.dart';
import 'theme_data/theme_data.dart';
import 'theme_extensions/theme_extensions.dart';

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
    // 🔘 Button theme section
    elevatedButtonTheme: appElevatedButtonTheme(colorScheme),
    outlinedButtonTheme: appOutlinedButtonTheme(colorScheme),
    textButtonTheme: appTextButtonTheme,
    // 🖼 ThemeData section
    bottomNavigationBarTheme: appBottomNavigationBarThemeData(
      colorScheme: colorScheme,
    ),
    cardTheme: appCardThemeData,
    chipTheme: appChipThemeData(colorScheme: colorScheme),
    inputDecorationTheme: appInputDecorationTheme(colorScheme: colorScheme),
    // Extensions
    extensions: [
      ThemeDescription(
        title: 'Light',
        subtitle: 'Light theme',
        icon: const Icon(Icons.wb_sunny, color: Colors.orange),
      ),
    ],
  );
}
