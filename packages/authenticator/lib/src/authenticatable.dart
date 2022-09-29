import 'package:firebase_auth/firebase_auth.dart';

abstract class Authenticatable {
  /// すでにサインイン済みかどうか
  bool get alreadySigned;

  /// サインイン
  Future<UserCredential> signIn();

  /// 再認証する
  Future<UserCredential> reauthenticate();

  /// ユーザーにAppleを紐付ける
  Future<UserCredential> link();

  /// Apple IDをリンク解除
  Future<User> unlink();
}
