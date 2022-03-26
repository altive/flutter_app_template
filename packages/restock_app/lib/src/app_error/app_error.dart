class AppError implements Error {
  const AppError(this.message);

  final String message;

  @override
  StackTrace get stackTrace => StackTrace.fromString(message);
}
