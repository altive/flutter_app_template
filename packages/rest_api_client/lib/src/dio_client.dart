import 'dart:io';

import 'package:dio/dio.dart';

Dio dioClient({
  String? baseUrl,
  int connectTimeout = 60000,
  int receiveTimeout = 60000,
  String? authorization,
  String? cookie,
  Map<String, Object?>? customHeaders,
  List<Interceptor> interceptors = const [],
}) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: <String, dynamic>{
        if (cookie != null) HttpHeaders.cookieHeader: cookie,
        if (authorization != null)
          HttpHeaders.authorizationHeader: authorization,
        if (customHeaders != null) ...customHeaders
      },
    ),
  )..interceptors.addAll(interceptors);
}
