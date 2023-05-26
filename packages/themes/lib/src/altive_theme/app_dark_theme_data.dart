import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'altive_dark_color_scheme.dart';
import 'altive_text_theme.dart';
import 'theme_data/theme_data.dart';
import 'theme_extensions/theme_extensions.dart';

ThemeData get appDarkThemeData {
  const colorScheme = altiveDarkColorScheme;

  final defaultThemeData = ThemeData.dark();
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
        title: 'Dark',
        subtitle: 'Dark theme',
        icon: const Icon(Icons.nightlife, color: Colors.red),
      ),
    ],
    // Workaround for: CupertinoTextInputDialog input text color and
    // background color are the same.
    // https://pub.dev/packages/adaptive_dialog#the-input-text-color-same-with-backgound-when-using-cupertinotextinputdialog
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
  );
}
