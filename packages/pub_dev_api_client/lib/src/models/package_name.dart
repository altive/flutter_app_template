import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package_name.g.dart';

/// Package name.
@JsonSerializable()
class PackageName extends Equatable {
  /// Default constructor.
  const PackageName({@JsonKey(name: 'package') required this.name});

  /// Create an instance from JSON.
  factory PackageName.fromJson(Map<String, dynamic> json) =>
      _$PackageNameFromJson(json);

  /// Package name.
  @JsonKey(name: 'package')
  final String name;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$PackageNameToJson(this);

  /// Create a copy of this instance with the given values.
  PackageName copyWith({String? name}) {
    return PackageName(name: name ?? this.name);
  }

  @override
  List<Object?> get props => [name];
}
