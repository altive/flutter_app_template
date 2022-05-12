import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/analytics/analytics.dart';
import 'core/app_constant/app_info.dart';
import 'providers/navigator.dart';
import 'router.dart';
import 'util/theme/ex_theme.dart';
import 'util/theme/theme_controller.dart';
import 'views/splash/splash_page.dart';

class App extends HookConsumerWidget {
  const App();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在のテーマを取得
    final currentTheme = ref.watch(themeColorProvider);
    // Firebase AnalyticsのObserverでPageRoute遷移の追跡を行う
    final analyticsObserver = ref.watch(analysisLoggerProvider).observer;
    return MaterialApp(
      title: ref.watch(appConstantProvider).title,
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
      navigatorKey: ref.watch(navigatorKeyProvider),
      navigatorObservers: [analyticsObserver],
    );
  }
}
