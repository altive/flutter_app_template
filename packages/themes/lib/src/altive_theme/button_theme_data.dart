import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        minimumSize: const Size.fromHeight(44),
      ),
    );

OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) =>
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: colorScheme.background,
        side: BorderSide(color: colorScheme.primary),
        minimumSize: const Size.fromHeight(44),
      ),
    );

TextButtonThemeData get textButtonTheme => TextButtonThemeData(
      style: TextButton.styleFrom(),
    );
