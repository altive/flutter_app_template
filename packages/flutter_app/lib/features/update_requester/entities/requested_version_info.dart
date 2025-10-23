import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'requested_version_info.freezed.dart';
part 'requested_version_info.g.dart';

@freezed
abstract class RequestedVersionInfo with _$RequestedVersionInfo {
  const factory RequestedVersionInfo({
    /// Required version e.g., '1.0.0'
    required String requiredVersion,

    /// Whether to allow canceling the update and continue using the app
    @Default(false) bool canCancel,

    /// Date and time when the update request becomes effective
    required DateTime enabledAt,
  }) = _RequestedVersionInfo;

  factory RequestedVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$RequestedVersionInfoFromJson(json);
}
