import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

import '../../../gen/strings.g.dart';

class SettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final i18n = Translations.of(context);
    return AppBar(
      title: Text(i18n.settings.page.app.bar.title),
    );
  }
}
