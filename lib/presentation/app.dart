import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'light_theme.dart';
import 'route/route.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routemaster = ref.watch(routemasterProvider);
    return MaterialApp.router(
      title: 'Flutter App Template',
      routerDelegate: routemaster,
      routeInformationParser: const RoutemasterParser(),
      theme: lightTheme,
    );
  }
}
