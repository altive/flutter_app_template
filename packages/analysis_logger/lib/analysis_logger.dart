library analysis_logger;

import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/// 解析に必要なログを送信する役割を持つ。
/// 使用側アプリでログ送信メソッドを増やしたい場合は、`extension` を使用してください。
///
/// ```dart
/// extension EventLogger on AnalysisLogger {
///   void logCustomEvent() {
///     analytics.logEvent(name: 'event_name', parameters:{'key': 'value'});
///   }
/// ```
class AnalysisLogger {
  AnalysisLogger({
    FirebaseAnalytics? analytics,
    FirebaseCrashlytics? crashlytics,
  })  : analytics = analytics ?? FirebaseAnalytics.instance,
        crashlytics = crashlytics ?? FirebaseCrashlytics.instance,
        observer = FirebaseAnalyticsObserver(
          analytics: analytics ?? FirebaseAnalytics.instance,
        );

  /// Firebase Analytics instance.
  final FirebaseAnalytics analytics;

  /// Firebase Crashlytics instance.
  final FirebaseCrashlytics crashlytics;

  final FirebaseAnalyticsObserver observer;

  /// Not supported on web
  Future<void> setDefaultEventParameters(
    Map<String, Object> defaultParameters,
  ) async {
    await analytics.setDefaultEventParameters(defaultParameters);
  }

  /// ユーザー情報をセットする。新規登録やログイン時の使用を想定。
  Future<void> setUser({
    required String id,
    Map<String, String?>? properties,
  }) async {
    await analytics.setUserId(id: id);
    properties?.forEach((key, value) {
      analytics.setUserProperty(name: key, value: value);
    });
    unawaited(crashlytics.setUserIdentifier(id));
  }

  /// ユーザー固有情報をリセットする。ログアウトや退会時の使用を想定。
  Future<void> resetUser() async {
    await analytics.setUserId();
    await crashlytics.setUserIdentifier('');
  }

  /// チュートリアルをどの程度のユーザーが開始し、完了しているかの指標を取るためのログ送信。
  Future<void> logTutorialBegin() async {
    await analytics.logTutorialBegin();
  }

  /// チュートリアルをどの程度のユーザーが開始し、完了しているかの指標を取るためのログ送信。
  Future<void> logTutorialComplete() async {
    await analytics.logTutorialComplete();
  }
}
