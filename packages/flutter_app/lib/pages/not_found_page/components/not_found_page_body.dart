import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/strings.g.dart';
import '../../../router/router.dart';
import '../../../widgets/widgets.dart';

class NotFoundPageBody extends HookConsumerWidget {
  const NotFoundPageBody({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(i18n.not.found.page.header.label),
        const Gap(32),
        DisplaySmallText(path),
        const Gap(32),
        Text(i18n.not.found.page.description),
        Center(
          child: ElevatedButton(
            onPressed: () => const HomeRouteData().go(context),
            child: Text(i18n.not.found.page.back.button.label),
          ),
        ),
      ],
    );
  }
}
