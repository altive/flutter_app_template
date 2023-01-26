/// Authentication with Firebase
library authenticator;

export 'package:firebase_auth/firebase_auth.dart'
    show AuthCredential, OAuthCredential, OAuthProvider;

export 'src/auth_user_provider.dart';
export 'src/authenticator.dart';
export 'src/firebase_auth_provider.dart';
export 'src/signing_method.dart';
export 'src/user_extension.dart';
