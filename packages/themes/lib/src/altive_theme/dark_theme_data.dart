import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';
import 'dark_color_scheme.dart';
import 'theme_data/theme_data.dart';
import 'theme_extensions/theme_extensions.dart';

/// Returns a [ThemeData] for dark theme.
ThemeData get darkThemeData {
  const colorScheme = darkColorScheme;

  final defaultThemeData = ThemeData.dark();
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
        title: 'Dark',
        subtitle: 'Dark theme',
        icon: Icon(Icons.nightlife, color: Colors.red),
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
