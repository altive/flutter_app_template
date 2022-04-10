import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/shared_preferences_service.dart';

enum StockDisplayMode {
  list,
  grid,
}

extension StockDisplayModeExt on StockDisplayMode {
  String get key => describeEnum(this);

  IconData get iconData {
    switch (this) {
      case StockDisplayMode.list:
        return Icons.list_alt;
      case StockDisplayMode.grid:
        return Icons.grid_on;
    }
  }
}

/// [StockDisplayMode]ストックリストの表示モード
final displayModeProvider = StateProvider(
  (ref) => ref.watch(sharedPreferencesServiceProvider).getStockDisplayMode,
);
