import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import 'models/models.dart';

part 'rest_api_client.g.dart';

/// Client for the REST API.
@RestApi()
abstract class RestApiClient {
  /// Internal constructor.
  factory RestApiClient.internal(
    Dio dio, {
    String baseUrl,
  }) = _RestApiClient;

  /// Create a client from parameters.
  factory RestApiClient.fromParameters({
    required String baseUrl,
    required Duration timeoutDuration,
  }) {
    return _RestApiClient(
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

  /// Search for packages.
  @GET('/search')
  Future<GetSearchResponseBody> search({
    @Query('q') String? searchWord,
    @Query('sort') String? sort = 'top',
    @Query('page') int? page,
  });

  /// Get package information.
  @GET('/packages/{name}')
  Future<GetPackageResponseBody> getPackage({
    @Path('name') required String packageName,
  });
}
