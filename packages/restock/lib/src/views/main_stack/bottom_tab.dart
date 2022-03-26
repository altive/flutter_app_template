import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../checker/checker_page.dart';
import '../mypage/mypage_page.dart';
import '../search_entrance/search_entrance_view.dart';
import '../stock_list_page/stock_list_page.dart';
import '../timeline/timeline_page.dart';

enum BottomTab {
  home,
  checker,
  search,
  timeline,
  mypage,
}

extension Ex on BottomTab {
  String get label => () {
        switch (this) {
          case BottomTab.home:
            return 'ストック';
          case BottomTab.checker:
            return 'チェッカー';
          case BottomTab.search:
            return 'ストック追加';
          case BottomTab.mypage:
            return 'マイページ';
          case BottomTab.timeline:
            return 'みんなの';
        }
      }();

  IconData get deactiveIconData => () {
        switch (this) {
          case BottomTab.home:
            return Icons.inventory;
          case BottomTab.checker:
            return MdiIcons.checkCircleOutline;
          case BottomTab.search:
            return MdiIcons.textBoxSearchOutline;
          case BottomTab.mypage:
            return MdiIcons.accountSettingsOutline;
          case BottomTab.timeline:
            return MdiIcons.timelineTextOutline;
        }
      }();

  IconData get activeIconData => () {
        switch (this) {
          case BottomTab.home:
            return Icons.inventory;
          case BottomTab.checker:
            return MdiIcons.checkCircle;
          case BottomTab.search:
            return MdiIcons.textBoxSearch;
          case BottomTab.mypage:
            return MdiIcons.accountSettings;
          case BottomTab.timeline:
            return MdiIcons.timelineText;
        }
      }();

  Widget get page => () {
        switch (this) {
          case BottomTab.home:
            return const StockListPage();
          case BottomTab.checker:
            return const CheckerPage();
          case BottomTab.search:
            return const SearchEntranceView();
          case BottomTab.mypage:
            return const MypagePage();
          case BottomTab.timeline:
            return const TimelinePage();
        }
      }();
}
