import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'top_level_tab.dart';

/// Top-level Tabの選択状態を提供する。
final topLevelTabProvider = StateProvider((_) => TopLevelTab.onetap);
