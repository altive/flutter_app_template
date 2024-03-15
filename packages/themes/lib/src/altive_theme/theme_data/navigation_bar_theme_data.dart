import 'package:flutter/material.dart';

NavigationBarThemeData navigationBarThemeData({
  required ColorScheme colorScheme,
}) {
  return const NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
  );
}
