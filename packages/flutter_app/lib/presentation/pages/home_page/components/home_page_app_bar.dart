import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../commons/localizer/localizer.dart';
import '../../../style/style.dart';

class HomePageAppBar extends HookWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Size get preferredSize => appBarSize;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return AppBar(
      title: Text(l10n.homePageAppBarTitle),
    );
  }
}
