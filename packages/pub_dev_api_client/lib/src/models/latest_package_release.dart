import 'package:freezed_annotation/freezed_annotation.dart';

import 'package_pubspec.dart';

part 'latest_package_release.freezed.dart';
part 'latest_package_release.g.dart';

/// Package details for the latest release.
@freezed
class LatestPackageRelease with _$LatestPackageRelease {
  /// Default constructor.
  const factory LatestPackageRelease({
    required PackagePubspec pubspec,
  }) = _LatestPackageRelease;

  /// Create an instance from JSON.
  factory LatestPackageRelease.fromJson(Map<String, dynamic> json) =>
      _$LatestPackageReleaseFromJson(json);
}
