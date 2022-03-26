import 'package:flutter/foundation.dart';

enum SearchItemsCategory {
  all,
  grocery,
}

extension KeyToString on SearchItemsCategory {
  /// enumの文字列を返却
  String get key => describeEnum(this);

  String get label {
    switch (this) {
      case SearchItemsCategory.all:
        return 'すべて';
      case SearchItemsCategory.grocery:
        return '食品のみ';
    }
  }

  String get searchIndex {
    switch (this) {
      case SearchItemsCategory.all:
        return 'All';
      case SearchItemsCategory.grocery:
        return 'GroceryAndGourmetFood';
    }
  }
}
