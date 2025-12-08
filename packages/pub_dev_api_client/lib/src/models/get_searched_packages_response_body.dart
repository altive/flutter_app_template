import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package_name.dart';

part 'get_searched_packages_response_body.g.dart';

/// Response body for the search API.
@JsonSerializable()
class GetSearchedPackagesResponseBody extends Equatable {
  /// Default constructor.
  const GetSearchedPackagesResponseBody({
    required this.packages,
    this.nextPageUrl,
  });

  /// Create an instance from JSON.
  factory GetSearchedPackagesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetSearchedPackagesResponseBodyFromJson(json);

  /// List of packages found.
  final List<PackageName> packages;

  /// URL for the next page of results.
  // e.g. "https://pub.dev/api/search?page=2"
  @JsonKey(name: 'next')
  final String? nextPageUrl;

  /// Get the next page number.
  int? get nextPage {
    final url = nextPageUrl;
    if (url == null) {
      return null;
    }

    final uri = Uri.parse(url);
    final page = uri.queryParameters['page'];
    if (page == null) {
      return null;
    }

    return int.tryParse(page);
  }

  /// Convert to JSON.
  Map<String, dynamic> toJson() =>
      _$GetSearchedPackagesResponseBodyToJson(this);

  /// Create a copy of this instance with the given values.
  GetSearchedPackagesResponseBody copyWith({
    List<PackageName>? packages,
    String? nextPageUrl,
  }) {
    return GetSearchedPackagesResponseBody(
      packages: packages ?? this.packages,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
    );
  }

  @override
  List<Object?> get props => [packages, nextPageUrl];
}
