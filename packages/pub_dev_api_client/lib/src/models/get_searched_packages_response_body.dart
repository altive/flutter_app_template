import 'package:freezed_annotation/freezed_annotation.dart';

import 'package_name.dart';

part 'get_searched_packages_response_body.freezed.dart';
part 'get_searched_packages_response_body.g.dart';

/// Response body for the search API.
@freezed
abstract class GetSearchedPackagesResponseBody with _$GetSearchedPackagesResponseBody {
  /// Default constructor.
  const factory GetSearchedPackagesResponseBody({
    required List<PackageName> packages,

    // e.g. "https://pub.dev/api/search?page=2"
    @JsonKey(name: 'next') String? nextPageUrl,
  }) = _GetSearchedPackagesResponseBody;

  const GetSearchedPackagesResponseBody._();

  /// Create an instance from JSON.
  factory GetSearchedPackagesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetSearchedPackagesResponseBodyFromJson(json);

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
}
