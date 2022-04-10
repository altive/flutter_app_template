import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_review/app_review.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

import '../../core/analytics/analytics.dart';
import '../../core/revenue/revenue.dart';
import '../../models/authenticator/auth_controller.dart';
import '../../models/remote_config/remote_config_provider.dart';
import '../../utils/utils.dart';
import '../main_stack/main_stack_view.dart';
import '../reception/reception_view.dart';
import 'splash_state.dart';

final splashPageControllerProvider =
    StateNotifierProvider<SplashPageController, SplashState>(
  SplashPageController.new,
);

/// アプリ起動直後に表示するスプラッシュ画面のロジック担当
class SplashPageController extends StateNotifier<SplashState> {
  // ----- Constructor ----- //
  SplashPageController(this._ref) : super(const SplashState());

  final Ref _ref;
  RevenueController get _purchasesController =>
      _ref.read(revenueControllerProvider.notifier);
  AnalysisLogger get _logger => _ref.read(analysisLoggerProvider);

  // Methods
  // ----------------------------------

  /// アプリの初期設定
  Future<Object>? initialize({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    // デフォルトLocaleの設定
    Intl.defaultLocale = 'ja_JP';
    await initializeDateFormatting('ja_JP');
    // In-App Purchasesの初期化
    await _purchasesController.initialSetup();
    // サインイン状態を取得
    final user = FirebaseAuth.instance.currentUser;
    // ProviderのStateに反映
    _ref.read(currentUserProvider.state).state = user;
    if (user == null) {
      // 未サインインなら、受付画面へ遷移する
      return Navigator.of(context).pushReplacementNamed(
        ReceptionPage.routeName,
      );
    } else {
      // サインインしていることが確定
      logger.fine('Signed User ID: ${user.uid}');
      // ユーザーのIDを設定
      _logger.setUser(id: user.uid);

      // バージョンアップの要求が必要かチェック、（不要・必要・必要だが後回し可能）
      final versionUpdateStatus = await shouldRequestVersionUp(
        ref: ref,
        uid: user.uid,
      );
      final storeName = Platform.isIOS ? 'App Store' : 'Google Play Store';
      const title = '最新バージョンが公開されています';
      final message = '$storeNameでアップデートをお願いします。';
      final okLabel = '$storeNameへ';
      switch (versionUpdateStatus) {
        case VersionUpdateStatus.none:
          // メイン画面へ遷移
          return Navigator.of(context).pushReplacementNamed(
            MainStackView.routeName,
          );

        case VersionUpdateStatus.need:
          await showOkAlertDialog(
            context: context,
            barrierDismissible: false,
            title: title,
            message: message,
            okLabel: okLabel,
          );
          // ストアへ飛ばす
          return AppReview.storeListing;

        case VersionUpdateStatus.needWithCancel:
          final result = await showOkCancelAlertDialog(
            context: context,
            barrierDismissible: false,
            title: title,
            message: message,
            okLabel: okLabel,
            cancelLabel: 'あとで',
          );
          switch (result) {
            case OkCancelResult.ok:
              // ストアへ飛ばす
              return AppReview.storeListing;
            case OkCancelResult.cancel:
              // メイン画面へ遷移
              return Navigator.of(context).pushReplacementNamed(
                MainStackView.routeName,
              );
          }
      }
    }
  }

  /// バージョンアップを求めるか否か
  Future<VersionUpdateStatus> shouldRequestVersionUp({
    required WidgetRef ref,
    required String uid,
  }) async {
    final remoteConfig = await _ref.read(remoteConfigProvider.future);
    if (remoteConfig == null) {
      return VersionUpdateStatus.none;
    }
    final requiredAppVersion = remoteConfig.requiredAppVersion;

    // 有効フラグがtrueじゃなければ要求しない
    if (!requiredAppVersion.isEnabled) {
      logger.finest('バージョンアップ要求はありません');
      return VersionUpdateStatus.none;
    }
    // リリース日が現在日時より後なら要求しない
    if (requiredAppVersion.enabledAt.compareTo(DateTime.now()) > 0) {
      logger.finest('バージョンアップ要求は有効ですが、まだリリース日ではありません');
      return VersionUpdateStatus.none;
    }
    final packageInfo = await PackageInfo.fromPlatform();
    final currentNumber = int.tryParse(packageInfo.buildNumber);
    final requiredNumber = requiredAppVersion.requiredBuildNumber;
    logger.fine('要求Number.$requiredNumber, 現在Number.$currentNumber');

    if (currentNumber == null) {
      logger.warning('Version情報がありません！データを確認してください');
      return VersionUpdateStatus.none;
    }

    if (currentNumber >= requiredNumber) {
      logger.finest('要求アプリバージョンを満たしています');
      return VersionUpdateStatus.none;
    }
    // 最小バージョンより現在のバージョンが低ければ要求する
    logger.info('新しいアプリバージョンが存在するため、バージョンアップを要求します');
    return requiredAppVersion.canCancel
        ? VersionUpdateStatus.needWithCancel
        : VersionUpdateStatus.need;
  }
}

enum VersionUpdateStatus {
  none,
  need,
  needWithCancel,
}
