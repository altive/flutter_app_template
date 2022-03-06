import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'auth_user_provider.dart';

final googleAuthenticatorProvider = Provider<GoogleAuthenticator>((ref) {
  return GoogleAuthenticator(ref.read);
});

class GoogleAuthenticator {
  GoogleAuthenticator(this._read);

  // ignore: unused_field
  final Reader _read;

  /// Google Sign in 用の認証証明書を取得する
  Future<AuthCredential?> requestGoogleAuthCredential() async {
    final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    final account = await googleSignIn.signIn();
    if (account == null) {
      // ユーザーによるキャンセル
      return null;
    }
    // FirebaseAuthで使用するためにGoogleSignInAuthenticationを取得する
    final authentication = await account.authentication;
    // トークンを使ってクレデンシャルを取得する
    final credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    return credential;
  }
}
