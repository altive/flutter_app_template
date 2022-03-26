import 'package:json_annotation/json_annotation.dart';

part 'required_version_parameter.g.dart';

@JsonSerializable()
class RequiredVersion {
  RequiredVersion({
    required this.requiredBuildNumber,
    required this.canCancel,
    required this.enabledAt,
    required this.isEnabled,
  });

  factory RequiredVersion.fromJson(Map<String, dynamic> json) =>
      _$RequiredVersionFromJson(json);

  Map<String, dynamic> get toJson => _$RequiredVersionToJson(this);

  /// 要求最小バージョン(e.g.: 10)
  final int requiredBuildNumber;

  /// 有効日（この日時以降に該当する場合に作動する）
  final DateTime enabledAt;

  /// 有効フラグ（trueの場合のみ作動する）
  final bool isEnabled;

  /// キャンセル可能かどうか
  final bool canCancel;
}
