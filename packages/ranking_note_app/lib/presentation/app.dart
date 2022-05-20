import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../domain/authenticator/authenticator.dart';
import '../domain/theme_selector/theme_selector.dart';
import 'router/router.dart';
import 'splash_page.dart';
import 'theme_data/dark_theme.dart';
import 'theme_data/light_theme.dart';

class App extends ConsumerWidget {
  const App();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(isSignedInProvider).value;

    if (isSignedIn == null) {
      return const SplashPage();
    }

    if (isSignedIn) {
      return MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
        routerDelegate: ref.watch(routerDelegateProvider),
        routeInformationParser: const RoutemasterParser(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ref.watch(themeSelectorProvider),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    }
    ref.watch(authenticatorProvider).signInAnonymously();
    return const SplashPage();
  }
}
