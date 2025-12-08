import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package_pubspec.g.dart';

/// Information about a package's pubspec.yaml.
@JsonSerializable()
class PackagePubspec extends Equatable {
  /// Default constructor.
  const PackagePubspec({
    required this.name,
    required this.version,
    required this.description,
  });

  /// Create an instance from JSON.
  factory PackagePubspec.fromJson(Map<String, dynamic> json) =>
      _$PackagePubspecFromJson(json);

  /// Package name.
  final String name;

  /// Package version.
  final String version;

  /// Package description.
  final String description;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$PackagePubspecToJson(this);

  /// Create a copy of this instance with the given values.
  PackagePubspec copyWith({
    String? name,
    String? version,
    String? description,
  }) {
    return PackagePubspec(
      name: name ?? this.name,
      version: version ?? this.version,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [name, version, description];
}
