import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../domain/authenticator/auth_user_provider.dart';
import '../domain/authenticator/authenticator.dart';
import 'light_theme.dart';
import 'route/route.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(isSignedInProvider).data?.value;

    if (isSignedIn == null) {
      return const _SplashView();
    }

    if (isSignedIn) {
      return MaterialApp.router(
        title: 'Flutter App Template',
        routerDelegate: ref.watch(routemasterProvider),
        routeInformationParser: const RoutemasterParser(),
        theme: lightTheme,
      );
    }

    ref.watch(authenticatorProvider).signInAnonymously();
    return const _SplashView();
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
