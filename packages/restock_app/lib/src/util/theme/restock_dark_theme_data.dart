import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

/// 標準のダークテーマ
ThemeData get restockDarkThemeData {
  const primaryColor = Color(0xFFb98c00);

  final colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    onPrimary: Colors.black,
    secondary: primaryColor,
    onSecondary: Colors.black,
    surface: Colors.grey[900],
    onSurface: Colors.white,
    background: Colors.black87,
    onBackground: Colors.white,
  );

  final altiveThemeData =
      const AltiveThemeData().dark(colorScheme: colorScheme);

  return altiveThemeData.copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(44, 44),
      ).merge(altiveThemeData.elevatedButtonTheme.style),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(44, 44),
      ).merge(altiveThemeData.outlinedButtonTheme.style),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(44, 44),
      ).merge(altiveThemeData.textButtonTheme.style),
    ),
    // RadioなどのActiveColor
    toggleableActiveColor: primaryColor,
  );
}
