import 'package:flutter/material.dart';

/// 集約されたメインタブ定義。
/// apps/restock 用。
enum MainTab {
  home(
    label: 'ホーム',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
  ),
  stockList(
    label: '備蓄リスト',
    icon: Icons.list_alt_outlined,
    selectedIcon: Icons.list_alt,
  ),
  addItem(
    label: '追加',
    icon: Icons.add_circle_outline,
    selectedIcon: Icons.add_circle,
  ),
  myPage(
    label: 'マイページ',
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
  );

  const MainTab({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
