import 'package:flutter/material.dart';

BottomNavigationBarThemeData appBottomNavigationBarThemeData({
  required ColorScheme colorScheme,
}) {
  return BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: colorScheme.background.withOpacity(0.5),
  );
}
