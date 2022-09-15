import 'package:flutter/material.dart';

class OnetapPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnetapPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('One Taps'),
    );
  }
}
