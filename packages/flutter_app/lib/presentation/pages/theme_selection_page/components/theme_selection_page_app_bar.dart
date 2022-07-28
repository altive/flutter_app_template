import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:themes/themes.dart';

import '../../../../util/localizer/localizer.dart';

class ThemeSelectionPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ThemeSelectionPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final themeDescription = Theme.of(context).extension<ThemeDescription>()!;
    return AppBar(
      title: Text(l10n.themeSelectionPageAppBarTitle),
      actions: [
        themeDescription.icon,
        Align(
          child: Text(
            themeDescription.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Gap(16),
      ],
    );
  }
}
