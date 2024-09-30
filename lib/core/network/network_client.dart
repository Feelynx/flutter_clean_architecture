import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/auth_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient {
  static Dio getDio({
    required String baseUrl,
    bool isAuthenticated = true,
  }) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.addAll([
        if (kDebugMode) PrettyDioLogger(requestBody: true, responseBody: true),
        if (isAuthenticated) AuthInterceptor(),
      ]);
  }
}
