import 'package:meta/meta.dart';

@immutable
class DataClass {
  const DataClass({required this.value});

  factory DataClass.fromJson(Map<String, dynamic> json) =>
      DataClass(value: json['value'] as String);

  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataClass &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '_Data(value: $value)';
}
