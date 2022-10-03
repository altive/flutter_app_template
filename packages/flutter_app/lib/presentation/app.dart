import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themes/themes.dart';

import '../domain/theme_selector/theme_selector.dart';
import '../util/localizer/localizer.dart';
import '../util/providers/app_lifecycle_state_provider.dart';
import '../util/providers/locales_provider.dart';
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
        appLifecycleStateProvider,
        (previous, next) => debugPrint('Previous: $previous, Next: $next'),
      );

    final router = ref.watch(routerProvider);

    const themeData = AltiveThemeData();

    return MaterialApp.router(
      onGenerateTitle: (context) => L10n.of(context).title,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: themeData.light(),
      darkTheme: themeData.dark(),
      themeMode: ref.watch(themeSelectorProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
