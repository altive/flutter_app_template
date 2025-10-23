import 'package:firebase_auth/firebase_auth.dart';

/// Interface for authenticatable classes.
///
/// This interface defines the methods required for authentication operations
/// such as sign-in, re-authentication, linking, and unlinking.
///
/// Implementing classes should provide concrete implementations for methods.
abstract class Authenticatable {
  /// Whether the user is already signed in.
  bool get alreadySigned;

  /// Signs in the user.
  ///
  /// For phone number authentication, the sign-in process is divided into
  /// two steps, and an [AuthCredential] needs to be provided from outside.
  /// Therefore, it is accepted as an optional argument.
  Future<UserCredential> signIn([AuthCredential? credential]);

  /// Re-authenticates the user.
  ///
  /// For phone number authentication, the re-authentication process is divided
  /// into two steps, and an [AuthCredential] needs to be provided from outside.
  /// Therefore, it is accepted as an optional argument.
  Future<UserCredential> reauthenticate([AuthCredential? credential]);

  /// Links the user with an authentication provider.
  ///
  /// For phone number authentication, the linking process is divided into
  /// two steps, and an [AuthCredential] needs to be provided from outside.
  /// Therefore, it is accepted as an optional argument.
  Future<UserCredential> link([AuthCredential? credential]);

  /// Unlinks the user from an authentication provider.
  Future<User> unlink();
}
