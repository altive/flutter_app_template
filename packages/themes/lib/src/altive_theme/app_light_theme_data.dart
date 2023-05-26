import 'package:flutter/material.dart';

import 'altive_light_color_scheme.dart';
import 'altive_text_theme.dart';
import 'theme_data/theme_data.dart';
import 'theme_extensions/theme_extensions.dart';

ThemeData get appLightThemeData {
  final colorScheme = altiveLightColorScheme;

  final defaultThemeData = ThemeData.light();
  final textTheme = defaultThemeData.textTheme.merge(altiveTextTheme);

  return defaultThemeData.copyWith(
    useMaterial3: true,
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
