import 'package:flutter/foundation.dart';

import 'app_error.dart';

export 'app_error.dart';

/// A sealed class that represents the result of an asynchronous process
@immutable
sealed class Result<T extends Object?> {
  const Result();
}

/// Success state
@immutable
final class Success<T> extends Result<T> {
  /// Create a success result
  const Success(this.data);

  /// The data
  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success(data: $data)';
}

/// Failure state
@immutable
final class Failure<T> extends Result<T> {
  /// Create a failure result
  const Failure(this.appError, [this.stackTrace]);

  /// Create a failure result from an exception
  Failure.fromException(Exception e, StackTrace stackTrace, [String? message])
    : this(AppError.fromException(e, stackTrace, message), stackTrace);

  /// The app error
  final AppError appError;

  /// The stack trace
  final StackTrace? stackTrace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          appError == other.appError &&
          stackTrace == other.stackTrace;

  @override
  int get hashCode => Object.hash(appError, stackTrace);

  @override
  String toString() => 'Failure(appError: $appError, stackTrace: $stackTrace)';
}

/// Extension methods for Result type
extension ResultExtension<T> on Result<T> {
  /// Get the data when successful (null when failed)
  T? get dataOrNull => switch (this) {
    Success(data: final data) => data,
    _ => null,
  };

  /// Get the error (null when successful)
  AppError? get errorOrNull => switch (this) {
    Failure(appError: final appError) => appError,
    _ => null,
  };

  /// Check if successful
  bool get isSuccess => this is Success<T>;

  /// Check if failed
  bool get isFailure => this is Failure<T>;

  /// Get the data when successful (throw exception when failed)
  T get requireData => switch (this) {
    Success(data: final data) => data,
    Failure(appError: final appError, stackTrace: final stackTrace) =>
      Error.throwWithStackTrace(appError, stackTrace ?? StackTrace.current),
  };

  /// Execute the success callback
  Result<U> map<U>(U Function(T data) mapper) => switch (this) {
    Success(data: final data) => Success(mapper(data)),
    Failure(appError: final appError, stackTrace: final stackTrace) => Failure(
      appError,
      stackTrace,
    ),
  };

  /// Execute the success async callback
  Future<Result<U>> mapAsync<U>(
    Future<U> Function(T data) mapper,
  ) async => switch (this) {
    Success(data: final data) => Success(await mapper(data)),
    Failure(appError: final appError, stackTrace: final stackTrace) => Failure(
      appError,
      stackTrace,
    ),
  };

  /// Execute the failure callback
  Result<T> catchError(T Function(AppError appError) handler) => switch (this) {
    Success() => this,
    Failure(appError: final appError) => Success(handler(appError)),
  };

  /// Implementation of when for pattern matching
  U when<U>({
    required U Function(T data) success,
    required U Function(AppError appError, StackTrace? stackTrace) failure,
  }) => switch (this) {
    Success(data: final data) => success(data),
    Failure(appError: final appError, stackTrace: final stackTrace) => failure(
      appError,
      stackTrace,
    ),
  };

  /// Implementation of maybeWhen for pattern matching
  U maybeWhen<U>({
    U Function(T data)? success,
    U Function(AppError appError, StackTrace? stackTrace)? failure,
    required U Function() orElse,
  }) => switch (this) {
    Success(data: final data) => success?.call(data) ?? orElse(),
    Failure(appError: final appError, stackTrace: final stackTrace) =>
      failure?.call(appError, stackTrace) ?? orElse(),
  };
}
