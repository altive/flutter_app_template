import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../domain/authenticator/authenticator.dart';
import '../domain/theme_selector/theme_selector.dart';
import '../l10n/l10n.dart';
import 'router/router.dart';
import 'splash_page.dart';
import 'theme_data/dark_theme.dart';
import 'theme_data/light_theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(isSignedInProvider).value;

    if (isSignedIn == null) {
      return const SplashPage();
    }

    if (isSignedIn) {
      return MaterialApp.router(
        onGenerateTitle: (context) => L10n.of(context)!.title,
        routerDelegate: ref.watch(routerDelegateProvider),
        routeInformationParser: const RoutemasterParser(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ref.watch(themeSelectorProvider),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
      );
    }
    ref.watch(authenticatorProvider).signInAnonymously();
    return const SplashPage();
  }
}
