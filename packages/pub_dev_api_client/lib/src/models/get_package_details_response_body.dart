import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'get_package_details_response_body.freezed.dart';
part 'get_package_details_response_body.g.dart';

/// Response body for the package details endpoint.
@freezed
class GetPackageDetailsResponseBody with _$GetPackageDetailsResponseBody {
  /// Default constructor.
  const factory GetPackageDetailsResponseBody({
    required String name,
    required LatestPackageRelease latest,
  }) = _GetPackageDetailsResponseBody;

  /// Create an instance from JSON.
  factory GetPackageDetailsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetPackageDetailsResponseBodyFromJson(json);
}
