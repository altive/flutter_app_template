import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoriesPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HistoriesPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      backgroundColor: Colors.transparent,
      title: Text(
        'Histories',
        // Because ThemeData is not reflected in Flutter 3.3.
        // https://github.com/flutter/flutter/issues/110878
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(CupertinoIcons.ellipsis_circle),
        ),
      ],
    );
  }
}
