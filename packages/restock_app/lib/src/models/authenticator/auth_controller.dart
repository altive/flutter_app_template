import 'package:collection/collection.dart' show IterableExtension;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import 'auth_error_code.dart';
import 'auth_method.dart';
import 'sign_with_apple_service.dart';

/// 現在のUser
final currentUserProvider = StateProvider<User?>((ref) => null);

/// 認証処理の提供者
final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController(
    ref.read,
    user: ref.watch(currentUserProvider),
  );
});

// 認証処理を担当する
// Firebase Auth の User を持つ
class AuthController extends StateNotifier<User?> {
  // ----- Constructor ----- //
  AuthController(
    this._read, {
    User? user,
  }) : super(user) {
    _auth.userChanges().listen((user) {
      // Userの変更を検知
      state = user;
    });
  }

  // ignore: unused_field
  final Reader _read;

  final _auth = FirebaseAuth.instance;

  // 認証状態の確認
  // ---------------------------------------------------------------------------

  /// 匿名認証かどうか
  /// stateを使わずに[user]を受け取っているのは、stateが変化したときにRebuildさせるため
  bool isAnonymous({required User? user}) {
    final state = this.state;
    if (state == null) {
      return false;
    }
    // 空なら匿名認証
    return state.providerData.isEmpty;
  }

  /// Apple認証済みかどうか
  bool get hasAppleLinked {
    final state = this.state;
    if (state == null) {
      return false;
    }
    final appleUserInfo = state.providerData.firstWhereOrNull(
      (userInfo) => userInfo.providerId == AuthMethod.apple.id,
    );
    return appleUserInfo != null;
  }

  /// Google認証済みかどうか
  bool get hasGoogleLinked {
    final state = this.state;
    if (state == null) {
      return false;
    }
    final googleUserInfo = state.providerData.firstWhereOrNull(
      (userInfo) => userInfo.providerId == AuthMethod.google.id,
    );
    return googleUserInfo != null;
  }

  // userInfoの取得
  // ---------------------------------------------------------------------------

  /// AppleのuserInfoを取得する
  /// stateを使わずに[user]を受け取っているのは、stateが変化したときにRebuildさせるため
  UserInfo? appleUserInfo({required User? user}) {
    if (user == null) {
      return null;
    }
    return user.providerData.firstWhereOrNull(
      (userInfo) => userInfo.providerId == AuthMethod.apple.id,
    );
  }

  /// GoogleのuserInfoを取得する
  /// stateを使わずに[user]を受け取っているのは、stateが変化したときにRebuildさせるため
  UserInfo? googleUserInfo({required User? user}) {
    if (user == null) {
      return null;
    }
    return user.providerData.firstWhereOrNull(
      (userInfo) => userInfo.providerId == AuthMethod.google.id,
    );
  }

  // Sign-in
  // ---------------------------------------------------------------------------

  /// FirebaseAuthの匿名認証でサインインする
  /// [FirebaseAuthException], [Exception] が発生する可能性がある
  Future<UserCredential> signInWithAnonymous() async {
    final userCredential = await _auth.signInAnonymously();
    // 状態更新
    state = userCredential.user;
    return userCredential;
  }

  /// Sign in with Apple
  /// [PlatformException], [FirebaseAuthException],
  ///  `SignInWithAppleException`, [Exception] が発生する可能性がある
  Future<UserCredential?> signInWithApple() async {
    final authCredential = await requestAppleAuthCredential();
    if (authCredential == null) {
      return null;
    }
    final userCredential = await _signInWithAuthCredential(authCredential);
    // ユーザー更新
    state = userCredential.user;
    return userCredential;
  }

  /// Sign in with Google
  /// [PlatformException], [Exception] が発生する可能性がある
  Future<UserCredential?> signInWithGoogle() async {
    final authCredential = await _requestGoogleAuthCredential();
    if (authCredential == null) {
      // ユーザーによるキャンセル
      return null;
    }
    final userCredential = await _signInWithAuthCredential(authCredential);
    // ユーザー更新
    state = userCredential.user;
    return userCredential;
  }

  // Account Link
  // ---------------------------------------------------------------------------

  /// Apple IDをリンクする
  ///
  /// AuthCredentialをリクエストしたときに[PlatformException], [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  /// 連携成功で`true`キャンセルの場合は`false`を返却する
  Future<bool> linkAppleAccount() async {
    final state = this.state;
    if (state == null) {
      return false;
    }
    // クレデンシャルを取得
    final authCredential = await requestAppleAuthCredential();
    if (authCredential == null) {
      // ユーザーキャンセル
      return false;
    }
    // 認証連携を実行
    try {
      final authResult = await state.linkWithCredential(authCredential);
      // 状態更新
      this.state = authResult.user;
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、認証連携を実行
          final authResult = await state.linkWithCredential(authCredential);
          // 状態更新
          this.state = authResult.user;
          return true;
        default:
          // 再認証必須以外の認証例外
          logger.warning('リンク失敗: $exception');
          rethrow;
      }
    }
  }

  /// Apple IDをリンク解除
  ///
  /// AuthCredentialをリクエストしたときに[PlatformException], [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  /// 連携成功で`true`キャンセルの場合は`false`を返却する
  Future<bool> unlinkAppleAccount() async {
    final state = this.state;
    if (state == null) {
      return false;
    }
    try {
      await state.unlink(AuthMethod.apple.id!);
      // 新しいユーザー情報で更新（不要かも？）
      this.state = _auth.currentUser;
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、リンク解除を実行
          await state.unlink(AuthMethod.apple.id!);
          // 新しいユーザー情報で更新（不要かも？）
          this.state = _auth.currentUser;
          return true;
        default:
          // 再認証必須以外の認証例外
          logger.warning('リンク解除失敗: $exception');
          rethrow;
      }
    }
  }

  /// Googleアカウントをリンクする
  ///
  /// AuthCredentialをリクエストしたときに[PlatformException], [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  Future<bool> linkGoogleAccount() async {
    final state = this.state;
    if (state == null) {
      return false;
    }
    // クレデンシャルを取得
    final authCredential = await _requestGoogleAuthCredential();
    if (authCredential == null) {
      // キャンセル
      return false;
    }
    // 認証連携を実行
    try {
      final authResult = await state.linkWithCredential(authCredential);
      // 状態更新
      this.state = authResult.user;
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、認証連携を実行
          final authResult = await state.linkWithCredential(authCredential);
          // 状態更新
          this.state = authResult.user;
          return true;
        default:
          // 再認証必須以外の認証例外
          logger.warning('リンク失敗: $exception');
          rethrow;
      }
    }
  }

  /// Googleアカウントをリンク解除
  ///
  /// AuthCredentialをリクエストしたときに[PlatformException], [Exception]が返却される可能性がある
  /// エラーハンドリングは上位に任せるためここではキャッチしない
  Future<bool> unlinkGoogleAccount() async {
    final state = this.state;
    if (state == null) {
      return false;
    }
    try {
      await state.unlink(AuthMethod.google.id!);
      // 新しいユーザー情報で更新（不要かも？）
      this.state = _auth.currentUser;
      return true;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、リンク解除を実行
          await state.unlink(AuthMethod.google.id!);
          // 新しいユーザー情報で更新（不要かも？）
          this.state = _auth.currentUser;
          return true;
        default:
          // 再認証必須以外の認証例外
          logger.warning('リンク解除失敗: $exception');
          rethrow;
      }
    }
  }

  // Sign-out
  // ---------------------------------------------------------------------------

  /// アカウントからサインアウトする
  /// [FirebaseAuthException]が発生し得る
  Future<void> signOut() async {
    await _auth.signOut();
    state = null; // 不要だと思う
  }

  /// アカウントを削除する
  /// [FirebaseAuthException], [Exception] が発生する可能性がある
  Future<void> deleteAccount() async {
    final state = this.state;
    if (state == null) {
      return;
    }
    try {
      // アカウントを削除実行
      await state.delete();
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case AuthErrorCode.requiresRecentLogin:
          // 再認証が必要なことを示す例外
          await _reauthenticate();
          // 再度、アカウント削除を実行
          await state.delete();
          break;
        default:
          // 再認証必須以外の認証例外
          rethrow;
      }
    }
  }

  // Private methods
  // ---------------------------------------------------------------------------

  /// 認証で得たCredentialを使ってサインインし、取得できたフルネームがあれば反映する
  /// [FirebaseAuthException], [Exception] が発生する可能性がある
  Future<UserCredential> _signInWithAuthCredential(
    AuthCredential authCredential,
  ) async {
    final userCredential = await _auth.signInWithCredential(authCredential);
    logger.info('サインイン成功：${userCredential.user!.uid}');
    // 状態更新
    state = userCredential.user;
    return userCredential;
  }

  /// Google認証のクレデンシャルを要求する
  Future<AuthCredential?> _requestGoogleAuthCredential() async {
    final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    // デバッグ環境ではキャンセルで例外がスローされるが、本番では問題なし
    final account = await googleSignIn.signIn();
    if (account == null) {
      return null;
    }
    logger.fine('Google account authorized');
    // FirebaseAuthで使用するためにGoogleSignInAuthenticationを取得する
    final authentication = await account.authentication;
    // トークンを使ってクレデンシャルを取得する
    final credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    return credential;
  }

  // 再認証を実施する
  Future<Object>? _reauthenticate() async {
    final state = this.state;
    if (state == null) {
      return false;
    }
    logger.info('アカウント削除には再認証が必要');
    // 匿名認証ユーザーの場合
    if (isAnonymous(user: state)) {
      return FirebaseAuth.instance.signInAnonymously();
    }
    AuthCredential? authCredential;
    // Google連携済みの場合
    if (hasGoogleLinked) {
      authCredential = await _requestGoogleAuthCredential();
    } else if (hasAppleLinked) {
      // Apple連携済みの場合
      authCredential = await requestAppleAuthCredential();
    }
    return state.reauthenticateWithCredential(authCredential!);
  }
}
