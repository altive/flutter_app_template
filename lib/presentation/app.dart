import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../commons/providers/flavor_provider.dart';
import '../commons/providers/navigator_key_provider.dart';
import '../commons/providers/package_info_provider.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final flavor = ref.watch(flavorProvider);
    final packageInfo = ref.watch(packageInfoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Flutter App Template.'),
            const Text('Author is Altive inc.'),
            const Text('Developed by Ryunosuke Muramatsu.'),
            const Divider(height: 56),
            Center(child: Text('App Info', style: textTheme.headline2)),
            const SizedBox(height: 16),
            Text('Flavor', style: textTheme.headline3),
            Text(flavor.value),
            const SizedBox(height: 32),
            Text('App name', style: textTheme.headline4),
            Text(packageInfo.appName),
            const SizedBox(height: 32),
            Text('Package name', style: textTheme.headline4),
            Text(packageInfo.packageName),
            const Divider(height: 56),
          ],
        ),
      ),
    );
  }
}
