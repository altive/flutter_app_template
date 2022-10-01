import 'package:flutter/material.dart';

class NewOnetapLogPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NewOnetapLogPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('New log'),
      actions: [TextButton(onPressed: () {}, child: const Text('完了'))],
    );
  }
}
