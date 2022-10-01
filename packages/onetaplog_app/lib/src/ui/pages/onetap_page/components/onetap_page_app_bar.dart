import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../top_level_tab_page/top_level_tab.dart';

class OnetapPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnetapPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      backgroundColor: Colors.transparent,
      title: Text(
        'One Taps',
        // Because ThemeData is not reflected in Flutter 3.3.
        // https://github.com/flutter/flutter/issues/110878
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      actions: [
        IconButton(
          onPressed: () =>
              const NewOnetapLogRoute(tab: TopLevelTab.onetap).push(context),
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
