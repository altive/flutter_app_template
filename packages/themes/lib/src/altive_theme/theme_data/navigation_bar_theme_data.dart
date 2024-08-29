import 'package:flutter/material.dart';

/// A [NavigationBarThemeData] for the app.
NavigationBarThemeData navigationBarThemeData({
  required ColorScheme colorScheme,
}) {
  return const NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
  );
}
