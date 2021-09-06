import 'package:flutter/material.dart';

const _primaryColor = Colors.amber;

ThemeData get lightTheme => ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        primaryVariant: Colors.amber,
        onPrimary: Colors.white,
        secondary: Colors.yellow,
        secondaryVariant: Colors.yellowAccent,
        onSecondary: Colors.black,
        background: Colors.white,
      ),
      primaryColor: _primaryColor,
      primaryColorLight: Colors.grey[200],
      primaryColorDark: _primaryColor[200],
      scaffoldBackgroundColor: Colors.grey[100],
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[300],
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
    );
