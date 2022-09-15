import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Settings'),
    );
  }
}
