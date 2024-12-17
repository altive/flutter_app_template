import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import 'models/models.dart';

part 'pub_dev_api_client.g.dart';

/// Client for the Pub.dev API.
@RestApi()
abstract class PubDevApiClient {
  /// Internal constructor.
  factory PubDevApiClient.internal(
    Dio dio, {
    String baseUrl,
  }) = _PubDevApiClient;

  /// Create a client from parameters.
  factory PubDevApiClient.fromParameters({
    required String baseUrl,
    required Duration timeoutDuration,
  }) {
    return _PubDevApiClient(
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: timeoutDuration,
          sendTimeout: timeoutDuration,
          receiveTimeout: timeoutDuration,
          contentType: Headers.jsonContentType,
        ),
      )..interceptors.add(
          LogInterceptor(
            responseBody: true,
          ),
        ),
    );
  }

  /// Get packages by search word.
  @GET('/search')
  Future<GetSearchedPackagesResponseBody> getSearchedPackages({
    @Query('q') String? searchWord,
    @Query('sort') String? sort = 'top',
    @Query('page') int? page,
  });

  /// Get particular package details.
  @GET('/packages/{name}')
  Future<GetPackageDetailsResponseBody> getPackageDetails({
    @Path('name') required String packageName,
  });
}
