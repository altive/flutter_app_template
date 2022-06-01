import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TopLevelTab {
  home(
    iconData: Icons.home,
  ),
  riverpodExample(
    iconData: Icons.stream,
  ),
  settings(
    iconData: Icons.settings,
  );

  const TopLevelTab({
    required this.iconData,
  });

  final IconData iconData;
}

extension TopLevelTabExt on TopLevelTab {
  String labelText(AppLocalizations l10n) {
    switch (this) {
      case TopLevelTab.home:
        return l10n.topLevelTabHomeLabel;
      case TopLevelTab.settings:
        return l10n.topLevelTabSettingsLabel;
      case TopLevelTab.riverpodExample:
        return l10n.topLevelTabRiverpodExampleLabel;
    }
  }
}
