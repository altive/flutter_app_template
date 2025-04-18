import 'package:flutter/material.dart';

/// 集約されたメインタブ定義。
/// apps/restock 用。
enum MainTab {
  home(
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
  ),
  explore(
    label: 'Explore',
    icon: Icons.search_outlined,
    selectedIcon: Icons.search,
  ),
  post(
    label: 'Post',
    icon: Icons.post_add_outlined,
    selectedIcon: Icons.post_add,
  ),
  me(
    label: 'Me',
    icon: Icons.account_circle_outlined,
    selectedIcon: Icons.account_circle,
  ),
  settings(
    label: 'Settings',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
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
