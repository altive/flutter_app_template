import 'package:flutter/material.dart';

const _primaryColor = Colors.amber;

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      primaryVariant: Colors.amber,
    ),
    primaryColor: _primaryColor,
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    iconTheme: const IconThemeData(color: _primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
  );
}
