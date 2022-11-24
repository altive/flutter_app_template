import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../histories_page/histories_page.dart';
import '../onetap_page/onetap_page.dart';
import '../settings_page/settings_page.dart';

enum TopLevelTab {
  onetap(
    activeIconData: Icons.touch_app_rounded,
    inactiveIconData: Icons.touch_app_outlined,
  ),
  histories(
    activeIconData: Icons.history_rounded,
    inactiveIconData: Icons.history_outlined,
  ),
  team(
    activeIconData: Icons.people,
    inactiveIconData: Icons.people_outline,
  ),
  settings(
    activeIconData: Icons.settings_rounded,
    inactiveIconData: Icons.settings_outlined,
  ),
  ;

  const TopLevelTab({
    required this.activeIconData,
    required this.inactiveIconData,
  });

  final IconData activeIconData;
  final IconData inactiveIconData;

  Widget get page {
    switch (this) {
      case TopLevelTab.onetap:
        return const OnetapPage();
      case TopLevelTab.histories:
        return const HistoriesPage();
      case TopLevelTab.settings:
        return const SettingsPage();
      case TopLevelTab.team:
        return const SettingsPage();
    }
  }

  String labelText(AppLocalizations l10n) {
    switch (this) {
      case TopLevelTab.onetap:
        return l10n.topLevelTabTasks;
      case TopLevelTab.histories:
        return l10n.topLevelTabHistories;
      case TopLevelTab.team:
        return l10n.topLevelTabTeam;
      case TopLevelTab.settings:
        return l10n.topLevelTabSettings;
    }
  }
}
