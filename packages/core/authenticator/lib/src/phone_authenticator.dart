import 'package:firebase_auth/firebase_auth.dart';

import 'authenticatable.dart';
import 'signing_method.dart';
import 'user_extension.dart';

/// PhoneAuthenticator is a class that implements the Authenticatable interface
/// to provide authentication using phone number verification with Firebase.
///
/// This class handles the authentication process for phone number verification,
/// including verifying the phone number, signing in, re-authenticating,
/// linking, and unlinking the phone provider.
///
/// It uses the FirebaseAuth instance to perform authentication operations.
///
/// Example usage:
/// ```dart
/// final phoneAuthenticator = PhoneAuthenticator(FirebaseAuth.instance);
/// await phoneAuthenticator.verifyPhoneNumber(
///   phoneNumber: '+1234567890',
///   verificationCompleted: (credential) async {
///     final userCredential = await phoneAuthenticator.signIn(credential);
///   },
///   verificationFailed: (exception) {
///     print('Failed to verify phone number: $exception');
///   },
///   codeSent: (verificationId, forceResendingToken) {
///     print('Verification code sent to phone number');
///   },
///   codeAutoRetrievalTimeout: (verificationId) {
///     print('Verification code auto-retrieval timed out');
///   },
/// );
/// ```
class PhoneAuthenticator implements Authenticatable {
  /// Creates a new instance of PhoneAuthenticator with
  /// the provided FirebaseAuth instance.
  PhoneAuthenticator(this._auth);

  final FirebaseAuth _auth;

  User get _user => _auth.currentUser!;

  @override
  bool get alreadySigned => _auth.currentUser?.hasPhoneSigning ?? false;

  /// Verifies the phone number and sends a verification code.
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential credential)
    verificationCompleted,
    required void Function(FirebaseAuthException exception) verificationFailed,
    required void Function(String verificationId, int? forceResendingToken)
    codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<UserCredential> signIn([AuthCredential? credential]) async {
    if (credential == null) {
      throw ArgumentError.notNull('credential');
    }
    return _auth.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> reauthenticate([AuthCredential? credential]) {
    if (credential == null) {
      throw ArgumentError.notNull('credential');
    }
    return _user.reauthenticateWithCredential(credential);
  }

  @override
  Future<UserCredential> link([AuthCredential? credential]) {
    if (credential == null) {
      throw ArgumentError.notNull('credential');
    }
    return _user.linkWithCredential(credential);
  }

  @override
  Future<User> unlink() {
    return _user.unlink(SigningMethod.phone.providerId);
  }
}
