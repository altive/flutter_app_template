import 'package:flutter/material.dart';

/// 集約されたメインタブ定義。
/// apps/restock 用。
enum MainTab {
  /// ホーム
  home(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    label: 'ホーム',
    routeName: '/',
  ),

  /// 備蓄リスト
  stockList(
    icon: Icons.inventory_2_outlined,
    selectedIcon: Icons.inventory_2,
    label: '備蓄リスト',
    routeName: '/stock-list',
  ),

  /// 追加
  addItem(
    icon: Icons.add_circle_outline,
    selectedIcon: Icons.add_circle,
    label: '追加',
    routeName: '/add-item',
  ),

  /// メニュー
  menu(
    icon: Icons.menu,
    selectedIcon: Icons.menu,
    label: 'メニュー',
    routeName: '/menu',
  );

  const MainTab({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.routeName,
  });

  /// アイコン
  final IconData icon;

  /// 選択時のアイコン
  final IconData selectedIcon;

  /// ラベル
  final String label;

  /// ルート名
  final String routeName;
}
