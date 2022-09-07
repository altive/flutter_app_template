import 'package:firebase_auth/firebase_auth.dart';

enum SigningMethod {
  anonymous,
  apple,
  google,
  ;

  String get providerId {
    switch (this) {
      case SigningMethod.anonymous:
        return 'firebase';
      case SigningMethod.apple:
        return AppleAuthProvider.PROVIDER_ID;
      case SigningMethod.google:
        return GoogleAuthProvider.PROVIDER_ID;
    }
  }
}
