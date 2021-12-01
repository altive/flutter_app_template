import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  String get title {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Lignt';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  String get subtitle {
    switch (this) {
      case ThemeMode.system:
        return 'Follows the system settings of the device';
      case ThemeMode.light:
        return 'Light theme';
      case ThemeMode.dark:
        return 'Dark theme';
    }
  }

  IconData get iconData {
    switch (this) {
      case ThemeMode.system:
        return Icons.autorenew;
      case ThemeMode.light:
        return Icons.wb_sunny;
      case ThemeMode.dark:
        return Icons.nightlife;
    }
  }
}
