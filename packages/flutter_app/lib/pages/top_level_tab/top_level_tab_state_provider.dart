import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'top_level_tab.dart';

part 'top_level_tab_state_provider.g.dart';

/// BottomNavigationBarの選択状態を提供する
@riverpod
class TopLevelTabState extends _$TopLevelTabState {
  @override
  TopLevelTab build() => TopLevelTab.home;
}
