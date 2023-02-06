import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'top_level_tab.dart';

/// BottomNavigationBarの状態を提供する
final topLevelTabProvider = StateProvider((_) => TopLevelTab.home);
