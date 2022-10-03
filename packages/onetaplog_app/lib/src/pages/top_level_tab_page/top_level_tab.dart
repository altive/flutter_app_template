import 'package:flutter/material.dart';

import '../histories_page/histories_page.dart';
import '../onetap_page/onetap_page.dart';
import '../settings_page/settings_page.dart';

// TODO(Riscait): 本当はEnhanced enumにしたかったが、
// go_router_builderがEnhanced Enumに対応していないため使用できず
// Issue: https://github.com/flutter/flutter/issues/105876
enum TopLevelTab {
  onetap,
  histories,
  settings,
}

extension TopLevelTabExt on TopLevelTab {
  IconData get activeIconData {
    switch (this) {
      case TopLevelTab.onetap:
        return Icons.touch_app_rounded;
      case TopLevelTab.histories:
        return Icons.history_rounded;
      case TopLevelTab.settings:
        return Icons.settings_rounded;
    }
  }

  IconData get inactiveIconData {
    switch (this) {
      case TopLevelTab.onetap:
        return Icons.touch_app_outlined;
      case TopLevelTab.histories:
        return Icons.history_outlined;
      case TopLevelTab.settings:
        return Icons.settings_outlined;
    }
  }

  Widget get page {
    switch (this) {
      case TopLevelTab.onetap:
        return const OnetapPage();
      case TopLevelTab.histories:
        return const HistoriesPage();
      case TopLevelTab.settings:
        return const SettingsPage();
    }
  }

  String labelText() {
    switch (this) {
      case TopLevelTab.onetap:
        return 'OneTap';
      case TopLevelTab.histories:
        return 'Histories';
      case TopLevelTab.settings:
        return 'Settings';
    }
  }
}
