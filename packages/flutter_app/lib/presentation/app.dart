import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:theme/theme.dart';

import '../commons/providers/app_lifecycle_provider.dart';
import '../commons/providers/locales_provider.dart';
import '../domain/authenticator/auth_user_provider.dart';
import '../domain/authenticator/authenticator.dart';
import '../domain/theme_selector/theme_selector.dart';
import '../l10n/l10n.dart';
import 'router/router.dart';
import 'splash_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

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

    final isSignedIn = ref.watch(isSignedInProvider).value;

    if (isSignedIn == null) {
      return const SplashPage();
    }

    if (isSignedIn) {
      return MaterialApp.router(
        onGenerateTitle: (context) => L10n.of(context)!.title,
        routerDelegate: ref.watch(routerDelegateProvider),
        routeInformationParser: const RoutemasterParser(),
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: ref.watch(themeSelectorProvider),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
      );
    }

    ref.watch(authenticatorProvider).signInAnonymously();
    return const SplashPage();
  }
}
