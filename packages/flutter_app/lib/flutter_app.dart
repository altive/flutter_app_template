import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themes/themes.dart';

import 'features/theme_selector/theme_selector.dart';
import 'router/router.dart';
import 'util/localizer/localizer.dart';
import 'util/logger.dart';
import 'util/providers/providers.dart';

class FlutterApp extends ConsumerWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<List<Locale>?>(
        localesProvider,
        (previous, next) => logger.fine('Previous: $previous, Next: $next'),
      )
      ..listen<AppLifecycleState>(
        appLifecycleStateProvider,
        (previous, next) => logger.fine('Previous: $previous, Next: $next'),
      );

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      onGenerateTitle: (context) => L10n.of(context).title,
      theme: appLightThemeData,
      darkTheme: appDarkThemeData,
      themeMode: ref.watch(themeSelectorProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
