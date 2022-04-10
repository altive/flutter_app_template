import 'package:analysis_logger/analysis_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/authenticator/auth_method.dart';
import '../../util/theme/ex_theme.dart';

export 'package:analysis_logger/analysis_logger.dart';

/// 解析送信クラスを提供する
final analysisLoggerProvider = Provider((ref) => AnalysisLogger());

enum AnalyticsPurchaseEvent {
  displayDescriptionPage,
}

/// アナリティクス
extension EventLogger on AnalysisLogger {
  void logCustomEvent() {
    analytics.logEvent(name: 'event_name', parameters: {'key': 'value'});
  }

  /// サインアップログを送信する
  void sendSignUpLog(AuthMethod signInMethod) {
    analytics.logSignUp(signUpMethod: signInMethod.key);
  }

  /// ログインログを送信する
  void sendLogInLog(AuthMethod signInMethod) {
    // 匿名認証ではログインできない
    assert(signInMethod != AuthMethod.anonymous);
    analytics.logLogin(loginMethod: signInMethod.key);
  }

  /// 購入（アプリ内課金）の実行を送信する
  void purchase({
    String? currencyCode,
    required double price,
  }) {
    analytics.logRefund(
      currency: currencyCode ?? 'JPY',
      value: price,
    );
  }

  /// ThemeModeの変更ログを送信する
  void sendChangeTheme(ExTheme themeMode) {
    analytics.logEvent(
      name: 'changeTheme',
      parameters: <String, dynamic>{'themeMode': themeMode.key},
    );
  }

  /// レビューが書かれたことを送信する
  void reviewWrited([String? text]) {
    analytics.logEvent(
      name: 'writeReview',
      parameters: text == null ? null : <String, Object>{'text': text},
    );
  }

  /// 開発者のTwitterリンクが開かれたことを送信する
  void twitterLinkOpened() {
    analytics.logEvent(name: 'openTwitterAtRiscait');
  }

  /// Webリンクが開かれたことを送信する
  void webLinkOpened(String urlString) {
    analytics.logEvent(
      name: 'webLinkOpened',
      parameters: <String, Object>{'url': urlString},
    );
  }
}
