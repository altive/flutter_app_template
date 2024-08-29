import 'package:flutter/material.dart';

/// A [AppBarTheme] for the app.
AppBarTheme appBarThemeData({required TextTheme textTheme}) {
  return AppBarTheme(
    titleTextStyle: textTheme.displayMedium,
  );
}
