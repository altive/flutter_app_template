import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../router/router.dart';
import '../../../util/localizer/localizer.dart';
import '../../../widgets/widgets.dart';

class NotFoundPageBody extends HookConsumerWidget {
  const NotFoundPageBody({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.notFoundPageHeaderLabel),
        const Gap(32),
        DisplaySmallText(path),
        const Gap(32),
        Text(l10n.notFoundPageDescription),
        Center(
          child: ElevatedButton(
            onPressed: () => const SplashRoute().go(context),
            child: Text(l10n.notFoundPageReturnButtonLabel),
          ),
        ),
      ],
    );
  }
}
