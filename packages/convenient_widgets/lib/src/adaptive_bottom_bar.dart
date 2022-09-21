import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Platformごとにだし分けるBottomBar
class AdaptiveBottomBar extends StatelessWidget {
  const AdaptiveBottomBar({
    super.key,
    required this.items,
    required this.backgroundColor,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavigationBarItem> items;
  final Color backgroundColor;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS || Platform.isMacOS
        ? CupertinoTabBar(
            items: items,
            backgroundColor: backgroundColor,
            currentIndex: currentIndex,
            onTap: onTap,
            iconSize: 24,
          )
        : BottomNavigationBar(
            items: items,
            backgroundColor: backgroundColor,
            currentIndex: currentIndex,
            onTap: onTap,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
          );
  }
}
