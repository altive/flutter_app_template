import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:themes/themes.dart';

import '../../../gen/strings.g.dart';
import '../../../widgets/widgets.dart';

class ThemeSelectionPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ThemeSelectionPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final themeDescription = context.themeDescription;
    return AppBar(
      title: Text(t.theme.selection.page.appBar.title),
      actions: [
        themeDescription.icon,
        Align(
          child: TitleLargeText(themeDescription.title),
        ),
        const Gap(16),
      ],
    );
  }
}
