import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_name.freezed.dart';
part 'package_name.g.dart';

/// Package name.
@freezed
class PackageName with _$PackageName {
  /// Default constructor.
  const factory PackageName({
    @JsonKey(name: 'package') required String name,
  }) = _PackageName;

  /// Create an instance from JSON.
  factory PackageName.fromJson(Map<String, dynamic> json) =>
      _$PackageNameFromJson(json);
}
