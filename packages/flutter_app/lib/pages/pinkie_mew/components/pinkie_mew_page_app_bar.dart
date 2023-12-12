import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

import '../../../gen/strings.g.dart';

class PinkieMewPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PinkieMewPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final i18n = Translations.of(context);
    return AppBar(
      title: Text(i18n.pinkie.mew.page.title),
    );
  }
}
