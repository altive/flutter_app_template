import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_pubspec.freezed.dart';
part 'package_pubspec.g.dart';

/// Information about a package's pubspec.yaml.
@freezed
class PackagePubspec with _$PackagePubspec {
  /// Default constructor.
  const factory PackagePubspec({
    required String name,
    required String version,
    required String description,
  }) = _PackagePubspec;

  /// Create an instance from JSON.
  factory PackagePubspec.fromJson(Map<String, dynamic> json) =>
      _$PackagePubspecFromJson(json);
}
