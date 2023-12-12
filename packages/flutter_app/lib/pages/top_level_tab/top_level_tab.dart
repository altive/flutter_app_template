import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';
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
  String labelText(Translations i18n) {
    switch (this) {
      case TopLevelTab.home:
        return i18n.top.level.tab.home.label;
      case TopLevelTab.riverpod:
        return i18n.top.level.tab.riverpod.example.label;
      case TopLevelTab.settings:
        return i18n.top.level.tab.settings.label;
    }
  }
}
