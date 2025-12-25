import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'get_package_details_response_body.g.dart';

/// Response body for the package details endpoint.
@JsonSerializable()
class GetPackageDetailsResponseBody extends Equatable {
  /// Default constructor.
  const GetPackageDetailsResponseBody({
    required this.name,
    required this.latest,
  });

  /// Create an instance from JSON.
  factory GetPackageDetailsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetPackageDetailsResponseBodyFromJson(json);

  /// Package name.
  final String name;

  /// Latest package release details.
  final LatestPackageRelease latest;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$GetPackageDetailsResponseBodyToJson(this);

  /// Create a copy of this instance with the given values.
  GetPackageDetailsResponseBody copyWith({
    String? name,
    LatestPackageRelease? latest,
  }) {
    return GetPackageDetailsResponseBody(
      name: name ?? this.name,
      latest: latest ?? this.latest,
    );
  }

  @override
  List<Object?> get props => [name, latest];
}
