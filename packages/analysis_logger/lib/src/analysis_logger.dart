import 'dart:async';
import 'dart:isolate';

import 'package:authenticator/authenticator.dart' show SigningMethod;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'analysis_event.dart';

/// 解析に必要なログを送信する役割を持つ。
///
/// ```dart
/// analysisLogger.sendSignUpLog('apple');
/// analysisLogger.sendEvent(customEvent);
/// ```
class AnalysisLogger {
  AnalysisLogger({
    FirebaseAnalytics? analytics,
    FirebaseCrashlytics? crashlytics,
    FirebaseAnalyticsObserver? observer,
  })  : analytics = analytics ?? FirebaseAnalytics.instance,
        _crashlytics = crashlytics ?? FirebaseCrashlytics.instance,
        observer = observer ??
            FirebaseAnalyticsObserver(
              analytics: analytics ?? FirebaseAnalytics.instance,
            );

  /// Firebase Analytics instance.
  final FirebaseAnalytics analytics;

  /// Firebase Crashlytics instance.
  final FirebaseCrashlytics _crashlytics;

  final FirebaseAnalyticsObserver observer;

  /// Not supported on web
  Future<void> setDefaultEventParameters(
    Map<String, Object> defaultParameters,
  ) async {
    await analytics.setDefaultEventParameters(defaultParameters);
  }

  /// ユーザーIDをセットする。新規登録やログイン時の使用を想定。
  Future<void> setUserId({
    required String id,
    Map<String, String?>? properties,
  }) async {
    await analytics.setUserId(id: id);
    unawaited(_crashlytics.setUserIdentifier(id));
  }

  /// ユーザープロパティをセットする
  Future<void> setUserProperties({
    required Map<String, String?> properties,
  }) async {
    properties.forEach((key, value) {
      analytics.setUserProperty(name: key, value: value);
    });
  }

  /// ユーザー固有情報をリセットする。ログアウトや退会時の使用を想定。
  Future<void> resetUser() async {
    await analytics.setUserId();
    await _crashlytics.setUserIdentifier('');
  }

  /// チュートリアルをどの程度のユーザーが開始し、完了しているかの指標を取るためのログ送信。
  Future<void> logTutorialBegin() async {
    await analytics.logTutorialBegin();
  }

  /// チュートリアルをどの程度のユーザーが開始し、完了しているかの指標を取るためのログ送信。
  Future<void> logTutorialComplete() async {
    await analytics.logTutorialComplete();
  }

  /// サインアップログを送信する
  Future<void> sendSignUpLog(SigningMethod signingMethod) async {
    await analytics.logSignUp(signUpMethod: signingMethod.name);
  }

  /// ログインログを送信する
  Future<void> sendLogInLog(SigningMethod signingMethod) async {
    await analytics.logLogin(loginMethod: signingMethod.name);
  }

  /// 購入（アプリ内課金）の実行を送信する
  /// currency example: 'JPY'
  Future<void> sendPurchaseLog({
    String? currency,
    required double price,
  }) async {
    await analytics.logRefund(
      currency: currency,
      value: price,
    );
  }

  Future<void> sendEvent(AnalysisEvent event) async {
    final global = event.global;
    await analytics.logEvent(
      name: event.name,
      parameters: event.parameters,
      callOptions: global == null ? null : AnalyticsCallOptions(global: global),
    );
  }

  /// Flutterフレームワークがキャッチしたエラーを記録するコールバック。
  ///
  /// 使用例：
  /// ```dart
  /// FlutterError.onError = analysisLogger.onFlutterError;
  /// ```
  Future<void> onFlutterError(
    FlutterErrorDetails flutterErrorDetails, {
    bool fatal = false,
  }) async {
    FlutterError.presentError(flutterErrorDetails);
    await _crashlytics.recordFlutterError(flutterErrorDetails, fatal: fatal);
  }

  /// Flutterフレームワークでキャッチできない非同期エラーを記録するコールバック。
  ///
  /// 使用例：
  /// ```dart
  /// PlatformDispatcher.instance.onError = analysisLogger.onPlatformError;
  /// ```
  bool onPlatformError(Object error, StackTrace stack) {
    unawaited(_crashlytics.recordError(error, stack, fatal: true));
    return true;
  }

  /// Flutter外部のエラーを記録するために[Isolate.current]に登録するリスナー。
  ///
  /// 使用例：
  /// ```dart
  /// Isolate.current.addErrorListener(
  ///   analysisLogger.isolateErrorListener()
  /// );
  /// ```
  SendPort isolateErrorListener() {
    return RawReceivePort((List<dynamic> pair) async {
      final errorAndStacktrace = pair;
      await _crashlytics.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last as StackTrace,
        fatal: true,
      );
    }).sendPort;
  }
}
