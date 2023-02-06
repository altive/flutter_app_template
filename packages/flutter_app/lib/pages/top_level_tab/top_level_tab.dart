import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home_page/home_page.dart';
import '../riverpod_example_page/riverpod_example_page.dart';
import '../settings_page/settings_page.dart';

enum TopLevelTab {
  home(
    iconData: Icons.home,
    page: HomePage(),
  ),
  riverpod(
    iconData: Icons.home,
    page: RiverpodExamplePage(),
  ),
  settings(
    iconData: Icons.home,
    page: SettingsPage(),
  ),
  ;

  const TopLevelTab({
    required this.iconData,
    required this.page,
  });

  final IconData iconData;
  final Widget page;
}

extension TopLevelTabExt on TopLevelTab {
  String labelText(AppLocalizations l10n) {
    switch (this) {
      case TopLevelTab.home:
        return l10n.topLevelTabHomeLabel;
      case TopLevelTab.riverpod:
        return l10n.topLevelTabRiverpodExampleLabel;
      case TopLevelTab.settings:
        return l10n.topLevelTabSettingsLabel;
    }
  }
}
