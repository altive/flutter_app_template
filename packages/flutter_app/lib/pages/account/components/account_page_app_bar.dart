import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

import '../../../gen/strings.g.dart';

class AccountPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AppBar(
      title: Text(t.accountPage.appBar.title),
    );
  }
}
