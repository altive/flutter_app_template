import 'package:flutter/material.dart';

class SplashPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SplashPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('One Taps'),
    );
  }
}
