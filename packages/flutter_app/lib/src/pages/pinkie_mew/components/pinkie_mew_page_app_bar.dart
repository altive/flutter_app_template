import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

import '../../../util/localizer/localizer.dart';

class PinkieMewPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PinkieMewPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return AppBar(
      title: Text(l10n.pinkieMewPageTitle),
    );
  }
}
