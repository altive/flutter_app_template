import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/analytics/analytics.dart';
import 'core/app_constant/app_info.dart';
import 'providers/navigator.dart';
import 'router.dart';
import 'util/theme/ex_theme.dart';
import 'util/theme/theme_controller.dart';
import 'views/splash/splash_page.dart';

class App extends HookWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 現在のテーマを取得
    final currentTheme = useProvider(themeColorProvider);
    // Firebase AnalyticsのObserverでPageRoute遷移の追跡を行う
    final analyticsObserver = useProvider(analyticsSenderProvider).observer;
    return MaterialApp(
      title: useProvider(appConstantProvider).title,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      initialRoute: SplashPage.routeName,
      onGenerateRoute: generateRoute,
      // テーマ設定
      theme: currentTheme.themeData,
      darkTheme: currentTheme.darkThemeData,
      // この `navigatorKey` を使用することで、`context` がなくても画面遷移できる
      navigatorKey: useProvider(navigatorKeyProvider),
      navigatorObservers: [analyticsObserver],
    );
  }
}
