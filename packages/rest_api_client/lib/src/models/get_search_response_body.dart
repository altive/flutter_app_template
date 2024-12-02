import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package_name.dart';

part 'get_search_response_body.freezed.dart';
part 'get_search_response_body.g.dart';

/// Response body for the search API.
@freezed
class GetSearchResponseBody with _$GetSearchResponseBody {
  /// Default constructor.
  const factory GetSearchResponseBody({
    required List<PackageName> packages,

    // e.g. "https://pub.dev/api/search?page=2"
    @JsonKey(name: 'next') String? nextPageUrl,
  }) = _GetSearchResponseBody;

  const GetSearchResponseBody._();

  /// Create an instance from JSON.
  factory GetSearchResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetSearchResponseBodyFromJson(json);

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
