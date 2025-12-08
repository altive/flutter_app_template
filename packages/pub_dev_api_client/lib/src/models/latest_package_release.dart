import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package_pubspec.dart';

part 'latest_package_release.g.dart';

/// Package details for the latest release.
@JsonSerializable()
class LatestPackageRelease extends Equatable {
  /// Default constructor.
  const LatestPackageRelease({required this.pubspec});

  /// Create an instance from JSON.
  factory LatestPackageRelease.fromJson(Map<String, dynamic> json) =>
      _$LatestPackageReleaseFromJson(json);

  /// Package pubspec.
  final PackagePubspec pubspec;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$LatestPackageReleaseToJson(this);

  /// Create a copy of this instance with the given values.
  LatestPackageRelease copyWith({PackagePubspec? pubspec}) {
    return LatestPackageRelease(pubspec: pubspec ?? this.pubspec);
  }

  @override
  List<Object?> get props => [pubspec];
}
