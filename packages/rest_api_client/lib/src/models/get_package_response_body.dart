import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'get_package_response_body.freezed.dart';
part 'get_package_response_body.g.dart';

/// Response body for the package details endpoint.
@freezed
class GetPackageResponseBody with _$GetPackageResponseBody {
  /// Default constructor.
  const factory GetPackageResponseBody({
    required String name,
    required LatestPackageRelease latest,
  }) = _GetPackageResponseBody;

  /// Create an instance from JSON.
  factory GetPackageResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetPackageResponseBodyFromJson(json);
}
