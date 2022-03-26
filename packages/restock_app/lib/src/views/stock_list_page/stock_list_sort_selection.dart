import 'package:flutter/foundation.dart';

enum StockSortSelection {
  expirationNear,
  expirationFar,
  nameAsc,
  nameDesc,
  memoAsc,
  memoDesc,
}

extension StockSortSelectionExt on StockSortSelection {
  String get key => describeEnum(this);

  bool get isExpirationNear => this == StockSortSelection.expirationNear;
  bool get isExpirationFar => this == StockSortSelection.expirationFar;

  bool get isNameAsc => this == StockSortSelection.nameAsc;
  bool get isNameDesc => this == StockSortSelection.nameDesc;

  bool get isMemoAsc => this == StockSortSelection.memoAsc;
  bool get isMemoDesc => this == StockSortSelection.memoDesc;
}
