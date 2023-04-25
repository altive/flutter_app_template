import 'dart:io';

import 'package:dio/dio.dart';

Dio dioClient({
  String? baseUrl,
  int timeoutMilliseconds = 60000,
  int receiveTimeoutMilliseconds = 60000,
  String? authorization,
  String? cookie,
  Map<String, Object?>? customHeaders,
  List<Interceptor> interceptors = const [],
}) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: Duration(milliseconds: timeoutMilliseconds),
      receiveTimeout: Duration(milliseconds: receiveTimeoutMilliseconds),
      headers: <String, dynamic>{
        if (cookie != null) HttpHeaders.cookieHeader: cookie,
        if (authorization != null)
          HttpHeaders.authorizationHeader: authorization,
        if (customHeaders != null) ...customHeaders
      },
    ),
  )..interceptors.addAll(interceptors);
}
