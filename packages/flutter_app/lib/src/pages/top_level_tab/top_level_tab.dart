import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home_page/home_page.dart';
import '../riverpod_example_page/riverpod_example_page.dart';
import '../settings_page/settings_page.dart';

// TODO(Riscait): 本当はEnhanced enumにしたかったが、
// go_router_builderがEnhanced Enumに対応していないため使用できず
// Issue: https://github.com/flutter/flutter/issues/105876
enum TopLevelTab {
  home,
  riverpod,
  settings,
}

extension TopLevelTabExt on TopLevelTab {
  IconData get iconData {
    switch (this) {
      case TopLevelTab.home:
        return Icons.home;
      case TopLevelTab.riverpod:
        return Icons.stream;
      case TopLevelTab.settings:
        return Icons.settings;
    }
  }

  Widget get page {
    switch (this) {
      case TopLevelTab.home:
        return const HomePage();
      case TopLevelTab.riverpod:
        return const RiverpodExamplePage();
      case TopLevelTab.settings:
        return const SettingsPage();
    }
  }

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
