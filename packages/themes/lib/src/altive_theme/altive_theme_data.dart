import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'altive_dark_color_scheme.dart';
import 'altive_light_color_scheme.dart';
import 'altive_text_theme.dart';
import 'button_theme_data.dart';
import 'theme_description.dart';

class AltiveThemeData {
  const AltiveThemeData();

  ThemeData light({ColorScheme? colorScheme, TextTheme? textTheme}) {
    final cs = colorScheme ?? altiveLightColorScheme;
    final tt = textTheme ?? altiveTextTheme;

    final defaultThemeData = ThemeData.light();
    return defaultThemeData.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: defaultThemeData.textTheme.merge(tt),
      primaryTextTheme: defaultThemeData.textTheme.merge(tt),
      elevatedButtonTheme: elevatedButtonTheme(cs),
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      cardTheme: const CardTheme(elevation: 0),
      extensions: [
        ThemeDescription(
          title: 'Light',
          subtitle: 'Light theme',
          icon: const Icon(Icons.wb_sunny, color: Colors.orange),
        ),
      ],
    );
  }

  ThemeData dark({ColorScheme? colorScheme, TextTheme? textTheme}) {
    final cs = colorScheme ?? altiveDarkColorScheme;
    final tt = textTheme ?? altiveTextTheme;

    final defaultThemeData = ThemeData.dark();
    return defaultThemeData.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: defaultThemeData.textTheme.merge(tt),
      elevatedButtonTheme: elevatedButtonTheme(cs),
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      extensions: [
        ThemeDescription(
          title: 'Dark',
          subtitle: 'Dark theme',
          icon: const Icon(Icons.nightlife, color: Colors.red),
        ),
      ],
      // ダイアログ内のTextFieldColorがBlackで視認できない問題のWorkaround
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
    );
  }
}
