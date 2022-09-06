import 'package:flutter/foundation.dart';

/// example:
/// ```dart
/// class ExampleLogParameter extends AnalysisEvent {
///   const ExampleLogParameter(this.treasureName);
///
///   final String treasureName;
///
///   @override
///   String get name => 'obtain_treasure';
///
///   @override
///   Map<String, Object?>? get parameters => {'treasure': treasureName};
/// }
@immutable
abstract class AnalysisEvent {
  const AnalysisEvent(this.treasureName);

  final String treasureName;

  String get name;
  Map<String, Object?>? get parameters;
  bool? get global => null;

  @override
  String toString() =>
      'Event(name: $name, parameters: $parameters, global: $global)';
}
