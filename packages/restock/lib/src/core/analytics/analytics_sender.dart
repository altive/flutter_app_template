import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/authenticator/auth_method.dart';
import '../../util/theme/ex_theme.dart';

/// 解析送信クラスを提供する
final analyticsSenderProvider = Provider<AnalyticsSender>((ref) {
  return AnalyticsSender(ref.read);
});

enum AnalyticsPurchaseEvent {
  displayDescriptionPage,
}

/// アナリティクス
class AnalyticsSender {
  AnalyticsSender(this._read);

  // ignore: unused_field
  final Reader _read;

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // MEMO: late final にする
  FirebaseAnalyticsObserver? _observer;
  FirebaseAnalyticsObserver get observer =>
      _observer ??= FirebaseAnalyticsObserver(analytics: analytics);

  /// ユーザーの一意の識別子を送信する
  void setUserId(String id) {
    analytics.setUserId(id: id);
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
