import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnetapPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnetapPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      title: Text(
        'One Taps',
        // Because ThemeData is not reflected in Flutter 3.3.
        // https://github.com/flutter/flutter/issues/110878
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(Icons.add_outlined),
        ),
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(CupertinoIcons.ellipsis_circle),
        ),
      ],
    );
  }
}
