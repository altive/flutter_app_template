import 'package:firebase_auth/firebase_auth.dart';

/// Error class for identifying errors that occur during authentication.
/// Generated from FirebaseAuthException.
sealed class AuthException implements Exception {
  factory AuthException.fromError(Object e) {
    if (e is! FirebaseAuthException) {
      return const AuthUndefinedError();
    }
    return switch (e.code) {
      // When Google authentication is cancelled, 'cancel' is returned.
      // When Apple authentication is cancelled, 'canceled' is returned.
      'cancel' || 'canceled' => const AuthCancelled(),
      'requires-recent-login' => const AuthRequiresRecentSignIn(),
      'invalid-phone-number' => const AuthInvalidPhoneNumber(),
      'credential-already-in-use' => const AuthCredentialAlreadyInUse(),
      'network-request-failed' => const AuthFailedNetworkRequest(),
      // 'email-already-in-use' => const ,
      // 'provider-already-linked' => const ,
      // 'too-many-requests' => const ,
      // 'account-exists-with-different-credential' => const ,
      // 'invalid-credential' => const ,
      // 'user-disabled' => const ,
      _ => const AuthUndefinedError(),
    };
  }
}

/// Error class indicating that authentication was cancelled.
class AuthCancelled implements AuthException {
  /// Creates a new instance of AuthCancelled.
  const AuthCancelled();
}

/// Error class indicating that recent sign-in is required.
class AuthRequiresRecentSignIn implements AuthException {
  /// Creates a new instance of AuthRequiresRecentSignIn.
  const AuthRequiresRecentSignIn();
}

/// Error class indicating that the phone number is invalid.
class AuthInvalidPhoneNumber implements AuthException {
  /// Creates a new instance of AuthInvalidPhoneNumber.
  const AuthInvalidPhoneNumber();
}

/// Error class indicating that the credential is already in use.
class AuthCredentialAlreadyInUse implements AuthException {
  /// Creates a new instance of AuthCredentialAlreadyInUse.
  const AuthCredentialAlreadyInUse();
}

/// Error class indicating that the network request failed.
class AuthFailedNetworkRequest implements AuthException {
  /// Creates a new instance of AuthFailedNetworkRequest.
  const AuthFailedNetworkRequest();
}

/// Error class indicating an undefined error.
class AuthUndefinedError implements AuthException {
  /// Creates a new instance of AuthUndefinedError.
  const AuthUndefinedError();
}

/// Error class indicating that sign-in is required.
class AuthRequiresSignIn implements AuthException {
  /// Creates a new instance of AuthRequiresSignIn.
  const AuthRequiresSignIn();
}
