import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:themes/themes.dart';

import '../../../util/localizer/localizer.dart';
import '../../../widgets/widgets.dart';

class ThemeSelectionPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ThemeSelectionPageAppBar({super.key});

  @override
  Size get preferredSize => appBarDefaultSize;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final themeDescription = context.themeDescription;
    return AppBar(
      title: Text(l10n.themeSelectionPageAppBarTitle),
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
