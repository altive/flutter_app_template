import 'package:flutter/material.dart';
import 'package:tracker/tracker.dart';

/// The severity of an error.
enum ErrorSeverity {
  /// Information level
  info,

  /// Warning level
  warning,

  /// Error level
  error,
}

/// The display mode of an error.
enum ErrorDisplayMode {
  /// Do not display the error (only log)
  none,

  /// Display the error in a snackbar
  snackbar,

  /// Display the error in a dialog
  dialog,
}

/// A sealed class that represents an application error.
@immutable
abstract class AppError implements Exception {
  /// Create an app error
  const AppError({
    required this.message,
    required this.displayMode,
    required this.severity,
    this.details,
    this.exception,
    this.stackTrace,
  });

  /// The error message
  final String message;

  /// The display mode of the error
  final ErrorDisplayMode displayMode;

  /// The severity of the error
  final ErrorSeverity severity;

  /// The details of the error
  final String? details;

  /// The original exception (optional)
  final Exception? exception;

  /// The stack trace (optional)
  final StackTrace? stackTrace;

  /// Get the error message with details
  String get messageWithDetails {
    if (details == null || details!.isEmpty) {
      return message;
    }
    return '$message: $details';
  }

  @override
  String toString() {
    return messageWithDetails;
  }

  /// Create an AppError from an exception
  static AppError fromException(
    Exception exception, [
    StackTrace? stackTrace,
    String? details,
  ]) {
    final stackTrace0 = stackTrace ?? StackTrace.current;

    return switch (exception) {
      final e
          when e.runtimeType.toString().contains('Network') ||
              e.runtimeType.toString().contains('Socket') ||
              e.runtimeType.toString().contains('Http') =>
        NetworkConnectionError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      final e when e.runtimeType.toString().contains('Timeout') => TimeoutError(
        exception: exception,
        stackTrace: stackTrace0,
        details: details,
      ),
      final e when e.runtimeType.toString().contains('Auth') =>
        AuthenticationError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      final e when e.runtimeType.toString().contains('Permission') =>
        PermissionError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      final e when e.runtimeType.toString().contains('NotFound') =>
        NotFoundError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      final e when e.runtimeType.toString().contains('Validation') =>
        ValidationError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      final e
          when e.runtimeType.toString().contains('Database') ||
              e.runtimeType.toString().contains('Firestore') =>
        DatabaseError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      final e
          when e.runtimeType.toString().contains('File') ||
              e.runtimeType.toString().contains('Storage') =>
        FileSystemError(
          exception: exception,
          stackTrace: stackTrace0,
          details: details,
        ),
      _ => UnexpectedError(
        exception: exception,
        stackTrace: stackTrace0,
        details: details,
      ),
    };
  }

  /// Show the error in the UI
  Future<void> show(BuildContext context) async {
    // Log the error
    _logError();

    switch (displayMode) {
      case ErrorDisplayMode.none:
        // Do not display the error (only log)
        return;
      case ErrorDisplayMode.snackbar:
        await _showSnackBar(context, messageWithDetails);
      case ErrorDisplayMode.dialog:
        await _showDialog(context, messageWithDetails);
    }
  }

  /// Log the error
  void _logError() {
    final logMessage =
        '$runtimeType: $message'
        '${details != null ? ' - Details: $details' : ''}';

    switch (severity) {
      case ErrorSeverity.info:
        logger.info(logMessage);
      case ErrorSeverity.warning:
        if (exception != null && stackTrace != null) {
          logger.warning(
            logMessage,
            error: exception,
            stackTrace: stackTrace,
          );
        } else {
          logger.warning(logMessage);
        }
      case ErrorSeverity.error:
        if (exception != null && stackTrace != null) {
          logger.severe(
            logMessage,
            error: exception,
            stackTrace: stackTrace,
          );
        } else {
          logger.severe(logMessage);
        }
    }
  }

  /// Show the error in a snackbar
  Future<void> _showSnackBar(BuildContext context, String message) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Set the color of the snackbar
    final backgroundColor = switch (severity) {
      ErrorSeverity.info => Colors.blue,
      ErrorSeverity.warning => Colors.orange,
      ErrorSeverity.error => Colors.red,
    };

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: scaffoldMessenger.hideCurrentSnackBar,
        ),
      ),
    );
  }

  /// Show the error in a dialog
  Future<void> _showDialog(BuildContext context, String message) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 48,
        ),
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// === Specific error types ===

/// Network connection error
@immutable
final class NetworkConnectionError extends AppError {
  /// Create a network connection error
  const NetworkConnectionError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Network connection error occurred',
         displayMode: ErrorDisplayMode.snackbar,
         severity: ErrorSeverity.warning,
       );
}

/// Timeout error
@immutable
final class TimeoutError extends AppError {
  /// Create a timeout error
  const TimeoutError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Request timed out',
         displayMode: ErrorDisplayMode.snackbar,
         severity: ErrorSeverity.warning,
       );
}

/// Authentication error
@immutable
final class AuthenticationError extends AppError {
  /// Create an authentication error
  const AuthenticationError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Authentication failed',
         displayMode: ErrorDisplayMode.dialog,
         severity: ErrorSeverity.info,
       );
}

/// Permission error
@immutable
final class PermissionError extends AppError {
  /// Create a permission error
  const PermissionError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Permission denied',
         displayMode: ErrorDisplayMode.dialog,
         severity: ErrorSeverity.info,
       );
}

/// Data not found error
@immutable
final class NotFoundError extends AppError {
  /// Create a data not found error
  const NotFoundError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Data not found',
         displayMode: ErrorDisplayMode.snackbar,
         severity: ErrorSeverity.info,
       );
}

/// Validation error
@immutable
final class ValidationError extends AppError {
  /// Create a validation error
  const ValidationError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Validation error',
         displayMode: ErrorDisplayMode.snackbar,
         severity: ErrorSeverity.warning,
       );
}

/// Database error
@immutable
final class DatabaseError extends AppError {
  /// Create a database error
  const DatabaseError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Database error occurred',
         displayMode: ErrorDisplayMode.none,
         severity: ErrorSeverity.error,
       );
}

/// File system error
@immutable
final class FileSystemError extends AppError {
  /// Create a file system error
  const FileSystemError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'File system error occurred',
         displayMode: ErrorDisplayMode.none,
         severity: ErrorSeverity.error,
       );
}

/// External service error
@immutable
final class ExternalServiceError extends AppError {
  /// Create an external service error
  const ExternalServiceError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'External service error occurred',
         displayMode: ErrorDisplayMode.none,
         severity: ErrorSeverity.error,
       );
}

/// Unexpected error
@immutable
final class UnexpectedError extends AppError {
  /// Create an unexpected error
  const UnexpectedError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Unexpected error occurred',
         displayMode: ErrorDisplayMode.none,
         severity: ErrorSeverity.error,
       );
}

/// Cancel error
@immutable
final class CancelError extends AppError {
  /// Create a cancel error
  const CancelError({
    super.exception,
    super.stackTrace,
    super.details,
  }) : super(
         message: 'Canceled',
         displayMode: ErrorDisplayMode.snackbar,
         severity: ErrorSeverity.info,
       );
}

/// Simple error (no exception information)
@immutable
final class SimpleError extends AppError {
  /// Create a simple error
  const SimpleError({
    required super.message,
    required super.displayMode,
    required super.severity,
    super.details,
  });
}
