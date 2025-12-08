import 'package:firebase_auth/firebase_auth.dart';

/// Enum class for identifying the method of authentication.
enum SigningMethod {
  /// Apple authentication.
  apple,

  /// Google authentication.
  google,

  /// Phone number authentication.
  phone,
  ;

  /// Returns the provider ID corresponding to the authentication method.
  String get providerId {
    switch (this) {
      case SigningMethod.apple:
        return AppleAuthProvider.PROVIDER_ID;
      case SigningMethod.google:
        return GoogleAuthProvider.PROVIDER_ID;
      case SigningMethod.phone:
        return PhoneAuthProvider.PROVIDER_ID;
    }
  }
}
