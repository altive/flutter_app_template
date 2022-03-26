import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/me/me.dart';
import '../../core/revenue/revenue.dart';
import '../../models/authenticator/auth_controller.dart';
import '../../models/authenticator/delete_me_usecase.dart';
import '../../models/authenticator/logout_usecase.dart';
import '../../views/reception/reception_view.dart';
import 'account_setting_state.dart';

final accountSettingPageControllerProvider = StateNotifierProvider.autoDispose<
    AccountSettingPageController, AccountSettingState>(
  (ref) => AccountSettingPageController(ref.read),
);

class AccountSettingPageController extends StateNotifier<AccountSettingState> {
  // ----- Constructor ----- //
  AccountSettingPageController(this._read) : super(const AccountSettingState());

  final Reader _read;

  AuthController get _authController => _read(authControllerProvider.notifier);
  LogoutUsecase get _logoutUsecase => _read(logoutUsecase);
  RevenueState get _revenueState => _read(revenueControllerProvider);
  MeRepository? get _meRepository => _read(meRepositoryProvider);

  // Methods
  // ----------------------------------------
  /// Appleアカウント連携のハンドリング
  /// 結果をテキストで返す
  Future<String?> linkOrUnlinkAppleAccount() async {
    if (_authController.hasAppleLinked) {
      // リンク解除
      final result = await _authController.unlinkAppleAccount();
      return result ? 'Appleアカウントとの連携を解除しました' : null;
    } else {
      // リンクする
      final result = await _authController.linkAppleAccount();
      return result ? 'Appleアカウントと連携しました' : null;
    }
  }

  /// Googleアカウント連携のハンドリング
  /// 結果をテキストで返す
  Future<String?> linkOrUnlinkGoogleAccount() async {
    if (_authController.hasGoogleLinked) {
      // リンク解除
      final result = await _authController.unlinkGoogleAccount();
      return result ? 'Googleアカウントとの連携を解除しました' : null;
    } else {
      // リンクする
      final result = await _authController.linkGoogleAccount();
      return result ? 'Googleアカウントと連携しました' : null;
    }
  }

  /// アカウントを削除する
  Future<void> deleteAccount(BuildContext context) async {
    // 確認が取れた場合のみ削除を実行するためにダイアログを表示
    if (await _presentConfirmDeletionDialog(context)) {
      // 状態更新：削除開始
      state = state.copyWith(loading: true);
      final result = await _read(deleteMeUsecase)();
      // 状態更新：削除終了
      state = state.copyWith(loading: false);

      if (result.isValue) {
        // 成功したら受付画面へ遷移
        await Navigator.of(context).pushNamedAndRemoveUntil(
          ReceptionPage.routeName,
          (_) => false,
        );
      } else {
        // 再認証が失敗、または削除自体が失敗
        await showOkAlertDialog(
          context: context,
          title: 'アカウント削除失敗',
          message: '大変恐れ入りますが、しばらく待ってからお試しいただくか、要望・不具合報告フォームよりご連絡ください。',
        );
      }
    }
  }

  /// みんなのストック向け非公開設定を変更する
  Future<String?> togglePrivateStockSwitch({required bool isPrivate}) async {
    if (!_revenueState.isSubscriber && isPrivate) {
      // Proプランユーザー以外は非公開にできない
      return 'マイストックの非公開機能はProプランユーザー限定機能です。\n※ 公開でも匿名表示です。';
    }
    await _meRepository?.updateStockVisibility(isPrivate: isPrivate);
    return null;
  }

  /// ログアウト
  Future<bool> logOut() async {
    // 状態更新：ログアウト開始
    state = state.copyWith(loading: true);
    final result = await _logoutUsecase();
    // 状態更新：ログアウト終了
    state = state.copyWith(loading: false);
    return result.isValue;
  }

  // Private Methods
  // ----------------------------------------
  /// アカウント削除前に確認する
  Future<bool> _presentConfirmDeletionDialog(BuildContext context) async {
    const keyword = 'Delete';
    return showTextAnswerDialog(
      context: context,
      keyword: keyword,
      hintText: keyword,
      title: '設定もすべて削除され、復旧することはできません',
      message: '最終確認のため「$keyword」と入力してください。',
      okLabel: '削除',
      cancelLabel: 'キャンセル',
      retryTitle: '入力間違いがあります',
      retryMessage: '$keywordと入力してから削除ボタンを押してください。',
      retryOkLabel: 'もう一度',
      retryCancelLabel: 'キャンセル',
      isDestructiveAction: true,
    );
  }
}
