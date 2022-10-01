import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:analysis_logger/analysis_logger.dart';
import 'package:authenticator/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/authenticator/auth_controller.dart';
import '../../my_account/my_account_model.dart';
import '../../util/nickname_maker.dart';
import '../../utils/utils.dart';
import '../main_stack/main_stack_view.dart';
import 'reception_state.dart';

final receptionProvider =
    StateNotifierProvider<ReceptionController, ReceptionState>(
  ReceptionController.new,
);

class ReceptionController extends StateNotifier<ReceptionState> {
  // ----- Constructor ----- //
  ReceptionController(this._ref) : super(const ReceptionState());

  final Ref _ref;

  AuthController get _authController =>
      _ref.read(authControllerProvider.notifier);
  AnalysisLogger get _logger => _ref.read(analysisLoggerProvider);

  // Methods
  // ----------------------------------------
  /// Sign in with Appleが押された
  Future<void> onPressedAppleButton(BuildContext context) async {
    // 状態更新：サインイン開始
    state = state.copyWith(loading: true);
    try {
      final userCredential = await _authController.signInWithApple();
      if (userCredential == null) {
        // キャンセル
        return;
      }
      return _afterSignIn(
        context: context,
        userCredential: userCredential,
        signInMethod: SigningMethod.apple,
      );
    } on PlatformException catch (e) {
      logger.warning(e);
      return _showErrorDialog(
        context: context,
        signInMethod: SigningMethod.apple,
      );
    } on FirebaseAuthException catch (e) {
      logger.warning(e);
      return _showErrorDialog(
        context: context,
        signInMethod: SigningMethod.apple,
      );
    } on Exception catch (e) {
      logger.warning(e);
      return _showErrorDialog(
        context: context,
        signInMethod: SigningMethod.apple,
      );
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  /// 「Googleでサインイン」が押された
  Future<void> onPressedGoogleButton(BuildContext context) async {
    // 状態更新：サインイン開始
    state = state.copyWith(loading: true);
    try {
      final userCredential = await _authController.signInWithGoogle();
      if (userCredential == null) {
        // キャンセル
        return;
      }
      return _afterSignIn(
        context: context,
        userCredential: userCredential,
        signInMethod: SigningMethod.google,
      );
    } on PlatformException catch (e) {
      logger.warning(e);
      return _showErrorDialog(
        context: context,
        signInMethod: SigningMethod.google,
      );
    } on FirebaseAuthException catch (e) {
      logger.warning(e);
      return _showErrorDialog(
        context: context,
        signInMethod: SigningMethod.google,
      );
    } on Exception catch (e) {
      logger.warning(e);
      return _showErrorDialog(
        context: context,
        signInMethod: SigningMethod.google,
      );
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  /// ゲストログインボタンが押された
  Future<void> onPressedAnonymousButton(BuildContext context) async {
    // 状態更新：サインイン開始
    state = state.copyWith(loading: true);
    final result = await _authController.signInWithAnonymous();

    // 匿名アカウントにサインアップ成功
    await _logger.setUserId(id: result.user!.uid);
    // ユーザーデータ作成
    await _createUserData();
    // Log送信
    logger.info('匿名アカウントで登録成功：${result.user!.uid}');
    await _logger.sendSignUpLog(SigningMethod.anonymous);
    // 状態更新：サインイン完了
    state = state.copyWith(loading: false);
    await Navigator.of(context).pushReplacementNamed(
      MainStackView.routeName,
    );
  }

  // ----------------------------------------
  // Private Methods
  // ----------------------------------------
  /// 認可失敗したときに表示するエラーダイアログ
  Future<void> _showErrorDialog({
    required BuildContext context,
    required SigningMethod signInMethod,
  }) {
    // 状態更新：サインイン失敗
    state = state.copyWith(loading: false);
    return showOkAlertDialog(
      context: context,
      title: 'サインイン失敗',
      message: '${signInMethod.name}認証に失敗しました',
    );
  }

  Future<void> _afterSignIn({
    required BuildContext context,
    required UserCredential? userCredential,
    required SigningMethod signInMethod,
  }) async {
    if (userCredential == null) {
      return _showErrorDialog(
        context: context,
        signInMethod: signInMethod,
      );
    }
    // ユーザーのIDを設定
    await _logger.setUserId(id: userCredential.user!.uid);
    // 初めての登録か否か
    if (userCredential.additionalUserInfo!.isNewUser) {
      // （初めての）登録の場合
      // ユーザーデータ作成
      await _createUserData();
      // ログ送信
      await _logger.sendSignUpLog(signInMethod);
      logger.fine('新規登録完了: $signInMethod');
    } else {
      // ログインの場合
      await _logger.sendLogInLog(signInMethod);
      logger.fine('ログイン完了: $signInMethod');
    }
    // 状態更新：サインイン完了
    state = state.copyWith(loading: false);
    await Navigator.of(context).pushReplacementNamed(
      MainStackView.routeName,
    );
  }

  /// ユーザーデータを初期作成する
  Future<void> _createUserData() async {
    // ユーザーデータを作成する
    // ニックネームもランダム生成
    final userData = AppUserModel(
      nickname: generateNickname(),
      stockCategories: ['玄関', '防災袋', 'キッチン'],
    );
    final uid = _authController.state?.uid;
    await appUsersRef.docRefWithId(uid).set(userData);
  }
}
