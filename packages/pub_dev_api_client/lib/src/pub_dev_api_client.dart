import 'package:dio/dio.dart';

import 'models/models.dart';

/// {@template pub_dev_api_client.PubDevApiClient}
/// Client for the Pub.dev API.
/// {@endtemplate}
class PubDevApiClient {
  /// {@macro pub_dev_api_client.PubDevApiClient}
  PubDevApiClient({
    required String baseUrl,
    required Duration timeoutDuration,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: timeoutDuration,
           sendTimeout: timeoutDuration,
           receiveTimeout: timeoutDuration,
           contentType: Headers.jsonContentType,
         ),
       )..interceptors.add(LogInterceptor(responseBody: true));

  final Dio _dio;

  /// Get packages by search word.
  Future<GetSearchedPackagesResponseBody> getSearchedPackages({
    String? searchWord,
    String? sort = 'top',
    int? page,
  }) async {
    final queryParameters = <String, dynamic>{
      'q': searchWord,
      'sort': sort,
      'page': page,
    }..removeWhere((_, value) => value == null);
    final response = await _dio.get<Map<String, dynamic>>(
      '/search',
      queryParameters: queryParameters,
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Response data is null.');
    }
    return GetSearchedPackagesResponseBody.fromJson(data);
  }

  /// Get particular package details.
  Future<GetPackageDetailsResponseBody> getPackageDetails({
    required String packageName,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/packages/$packageName',
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Response data is null.');
    }
    return GetPackageDetailsResponseBody.fromJson(data);
  }
}
