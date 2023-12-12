import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';

extension ThemeModeExt on ThemeMode {
  String title(Translations i18n) {
    switch (this) {
      case ThemeMode.system:
        return i18n.theme.mode.title.system;
      case ThemeMode.light:
        return i18n.theme.mode.title.dark;
      case ThemeMode.dark:
        return i18n.theme.mode.title.dark;
    }
  }

  String subtitle(Translations i18n) {
    switch (this) {
      case ThemeMode.system:
        return i18n.theme.mode.subtitle.system;
      case ThemeMode.light:
        return i18n.theme.mode.subtitle.light;
      case ThemeMode.dark:
        return i18n.theme.mode.subtitle.dark;
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
