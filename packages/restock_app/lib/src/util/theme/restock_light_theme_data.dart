import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

/// 標準のライトテーマ
ThemeData get restockLightThemeData {
  const primaryColor = Color(0xFFF0BC1B);
  const primaryDarkColor = Color(0xFFcc9900);

  final colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: primaryColor,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
    background: Colors.white,
    onBackground: Colors.black87,
  );

  final altiveThemeData =
      const AltiveThemeData().light(colorScheme: colorScheme);

  return altiveThemeData.copyWith(
    tabBarTheme: const TabBarTheme(
      labelColor: primaryDarkColor,
      unselectedLabelColor: Colors.black,
    ),
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
