import 'package:flutter/material.dart';

const _primaryColor = Colors.amber;

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: _primaryColor,
      primaryVariant: Colors.amber,
      secondary: Colors.brown,
      surface: Colors.grey[800]!,
      background: Colors.black,
    ),
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: Colors.grey[850],
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.grey[850],
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
      fillColor: Colors.grey[700],
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
  );
}
