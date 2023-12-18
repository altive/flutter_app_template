import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';

extension ThemeModeExt on ThemeMode {
  String title(Translations t) {
    switch (this) {
      case ThemeMode.system:
        return t.theme.mode.title.system;
      case ThemeMode.light:
        return t.theme.mode.title.light;
      case ThemeMode.dark:
        return t.theme.mode.title.dark;
    }
  }

  String subtitle(Translations t) {
    switch (this) {
      case ThemeMode.system:
        return t.theme.mode.subtitle.system;
      case ThemeMode.light:
        return t.theme.mode.subtitle.light;
      case ThemeMode.dark:
        return t.theme.mode.subtitle.dark;
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
