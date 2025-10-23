/// authenticator with FlutterFire Authentication.
library;

export 'package:firebase_auth/firebase_auth.dart'
    show
        AuthCredential,
        OAuthCredential,
        OAuthProvider,
        PhoneAuthProvider,
        User,
        UserCredential;

export 'src/auth_exception.dart';
export 'src/authenticator.dart';
export 'src/signing_method.dart';
export 'src/user_extension.dart';
