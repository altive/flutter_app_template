import 'package:flutter/material.dart';

import 'button_theme.dart';

const _primaryColor = Colors.amber;

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      primaryContainer: Colors.amber,
      secondary: Colors.yellow,
      secondaryContainer: Colors.yellowAccent,
    ),
    primaryColor: _primaryColor,
    primaryColorLight: Colors.grey[200],
    primaryColorDark: _primaryColor[200],
    scaffoldBackgroundColor: Colors.grey[100],
    dividerColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.grey[100],
      foregroundColor: Colors.black,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    iconTheme: const IconThemeData(color: _primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      isDense: true,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
  );
}
