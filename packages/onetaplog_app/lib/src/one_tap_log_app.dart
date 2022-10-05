import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themes/themes.dart';

import 'router/router.dart';
import 'util/localizer/localizer.dart';

class OneTapLogApp extends ConsumerWidget {
  const OneTapLogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    const themeData = AltiveThemeData();
    return MaterialApp.router(
      routerConfig: router,
      onGenerateTitle: (context) => L10n.of(context).title,
      theme: themeData.light(),
      darkTheme: themeData.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
