import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/utils.dart';

Future<AuthCredential?> requestGoogleAuthCredential() async {
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
