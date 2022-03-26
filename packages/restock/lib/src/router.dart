import 'package:flutter/material.dart';

import 'core/revenue/revenue.dart';
import 'views/about_this_app/about_this_app.dart';
import 'views/account_setting/account_setting_page.dart';
import 'views/checker/recommend_detail/recommend_detail_page.dart';
import 'views/favorites_list/favorites_list_page.dart';
import 'views/main_stack/main_stack_view.dart';
import 'views/notification_schedules/notification_schedules_page.dart';
import 'views/notification_setting/notification_setting_page.dart';
import 'views/place_editor/place_editor_page.dart';
import 'views/pro_plan/pro_plan_page.dart';
import 'views/reception/reception_view.dart';
import 'views/search_result/search_result_view.dart';
import 'views/splash/splash_page.dart';
import 'views/stock_detail/stock_detail_page.dart';
import 'views/stock_editor/stock_editor_page.dart';
import 'views/theme_selection/theme_selection_page.dart';
import 'views/user_request/user_request_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // スプラッシュ画面
    case SplashPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const SplashPage(),
      );

    // 受付画面
    case ReceptionPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const ReceptionPage(),
      );

    // BottomTabを管理する画面
    case MainStackView.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const MainStackView(),
      );

    // テーマ選択画面
    case ThemeSelectionPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const ThemeSelectionPage(),
      );

    // 通知の設定画面
    case NotificationSettingPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const NotificationSettingPage(),
      );

    // 送信待ち通知リストの画面
    case NotificationSchedulesPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const NotificationSchedulesPage(),
      );

    // お気に入り画面
    case FavoritesListPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const FavoritesListPage(),
      );

    // ストックグループ編集画面
    case PlaceEditorPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const PlaceEditorPage(),
      );

    // アカウント設定画面
    case AccountSettingPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const AccountSettingPage(),
      );

    // ユーザーレポート（要望・不具合）送信画面
    case UserRequestPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const UserRequestPage(),
      );

    // 検索結果画面
    case SearchResultView.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const SearchResultView(),
      );

    // アイテム詳細画面
    case StockDetailPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const StockDetailPage(),
      );

    // ストックアイテムを登録・更新・複製する画面
    case StockEditorPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => StockEditorPage(),
      );

    // お勧め商品セット詳細を表示する画面
    case RecommendDetailPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const RecommendDetailPage(),
      );

    // Proプランの案内ページ
    case ProPlanPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const ProPlanPage(),
      );

    // アプリ内課金デバッグ画面の案内ページ
    case PurchaseDebugPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const PurchaseDebugPage(),
      );

    // このアプリについて画面の案内ページ
    case AboutThisAppPage.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const AboutThisAppPage(),
      );

    default:
      return null;
  }
}
