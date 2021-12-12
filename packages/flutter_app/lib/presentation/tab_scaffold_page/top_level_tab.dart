import 'package:flutter/material.dart';

enum TopLevelTab {
  home,
  settings,
}

extension TopLevelTabExt on TopLevelTab {
  String get labelText {
    switch (this) {
      case TopLevelTab.home:
        return 'Home';
      case TopLevelTab.settings:
        return 'Settings';
    }
  }

  IconData get iconData {
    switch (this) {
      case TopLevelTab.home:
        return Icons.home;
      case TopLevelTab.settings:
        return Icons.settings;
    }
  }
}
