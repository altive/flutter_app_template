import 'package:flutter/material.dart';

enum TopLevelTab {
  home,
  search,
  settings,
}

extension TopLevelTabExt on TopLevelTab {
  String get label {
    switch (this) {
      case TopLevelTab.home:
        return 'Home';
      case TopLevelTab.search:
        return 'Search';
      case TopLevelTab.settings:
        return 'Settings';
    }
  }

  IconData get iconData {
    switch (this) {
      case TopLevelTab.home:
        return Icons.home;
      case TopLevelTab.search:
        return Icons.search;
      case TopLevelTab.settings:
        return Icons.settings;
    }
  }
}
