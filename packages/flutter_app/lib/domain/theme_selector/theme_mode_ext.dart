import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ThemeModeExt on ThemeMode {
  String title(AppLocalizations l10n) {
    switch (this) {
      case ThemeMode.system:
        return l10n.themeModeTitleSystem;
      case ThemeMode.light:
        return l10n.themeModeTitleLight;
      case ThemeMode.dark:
        return l10n.themeModeTitleDark;
    }
  }

  String subtitle(AppLocalizations l10n) {
    switch (this) {
      case ThemeMode.system:
        return l10n.themeModeSubtitleSystem;
      case ThemeMode.light:
        return l10n.themeModeSubtitleLight;
      case ThemeMode.dark:
        return l10n.themeModeSubtitleDark;
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
