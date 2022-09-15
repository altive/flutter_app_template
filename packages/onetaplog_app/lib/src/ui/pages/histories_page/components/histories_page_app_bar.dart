import 'package:flutter/material.dart';

class HistoriesPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HistoriesPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Histories'),
    );
  }
}
