import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'requested_version_info.freezed.dart';
part 'requested_version_info.g.dart';

@freezed
class RequestedVersionInfo with _$RequestedVersionInfo {
  const factory RequestedVersionInfo({
    /// 要求バージョン e.g., '1.0.0'
    required String requiredVersion,

    /// アップデートをキャンセルして利用可能にするかどうか
    @Default(false) bool canCancel,

    /// アップデート要求を有強化する日時
    required DateTime enabledAt,
  }) = _RequestedVersionInfo;

  factory RequestedVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$RequestedVersionInfoFromJson(json);
}
