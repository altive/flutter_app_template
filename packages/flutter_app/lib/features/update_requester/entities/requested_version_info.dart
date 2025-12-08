import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'requested_version_info.g.dart';

@JsonSerializable()
class RequestedVersionInfo extends Equatable {
  const RequestedVersionInfo({
    required this.requiredVersion,
    this.canCancel = false,
    required this.enabledAt,
  });

  factory RequestedVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$RequestedVersionInfoFromJson(json);

  /// Required version e.g., '1.0.0'
  final String requiredVersion;

  /// Whether to allow canceling the update and continue using the app
  final bool canCancel;

  /// Date and time when the update request becomes effective
  final DateTime enabledAt;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$RequestedVersionInfoToJson(this);

  /// Create a copy of this instance with the given values.
  RequestedVersionInfo copyWith({
    String? requiredVersion,
    bool? canCancel,
    DateTime? enabledAt,
  }) {
    return RequestedVersionInfo(
      requiredVersion: requiredVersion ?? this.requiredVersion,
      canCancel: canCancel ?? this.canCancel,
      enabledAt: enabledAt ?? this.enabledAt,
    );
  }

  @override
  List<Object?> get props => [requiredVersion, canCancel, enabledAt];
}
