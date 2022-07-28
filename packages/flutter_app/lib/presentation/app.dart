import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themes/themes.dart';

import '../commons/providers/app_lifecycle_provider.dart';
import '../commons/providers/locales_provider.dart';
import '../domain/theme_selector/theme_selector.dart';
import '../util/localizer/localizer.dart';
import 'router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<List<Locale>?>(
        localesProvider,
        (previous, next) => debugPrint('Previous: $previous, Next: $next'),
      )
      ..listen<AppLifecycleState>(
        appLifecycleProvider,
        (previous, next) => debugPrint('Previous: $previous, Next: $next'),
      );

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => L10n.of(context).title,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      theme: altiveLightThemeData,
      darkTheme: altiveDarkThemeData,
      themeMode: ref.watch(themeSelectorProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
