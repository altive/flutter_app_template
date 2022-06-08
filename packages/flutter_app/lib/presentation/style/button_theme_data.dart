import 'package:flutter/material.dart';

ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
      ),
    );

OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
      ),
    );

TextButtonThemeData get textButtonTheme => TextButtonThemeData(
      style: TextButton.styleFrom(),
    );
