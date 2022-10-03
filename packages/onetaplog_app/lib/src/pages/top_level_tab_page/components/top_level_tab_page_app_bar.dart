import 'package:flutter/material.dart';

class TopLevelTabPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TopLevelTabPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('TopLevelTab'),
    );
  }
}
