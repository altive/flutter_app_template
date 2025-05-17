import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'main_tab.dart';

part 'main_tab_provider.g.dart';

@Riverpod(keepAlive: true)
class MainTabState extends _$MainTabState {
  @override
  MainTab build() => MainTab.home;

  void setTabFromIndex(int index) => state = MainTab.values[index];
}
