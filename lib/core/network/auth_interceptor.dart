import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = authNotifier.loginResponseEntity?.accessToken;
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      await authNotifier.refreshAuthToken();
      retry(err, handler);
    }
    super.onError(err, handler);
  }

  void retry(DioException err, ErrorInterceptorHandler handler) {
    final request = err.requestOptions;
    final token = authNotifier.loginResponseEntity?.accessToken;
    request.headers['Authorization'] = 'Bearer $token';
    handler.next(err);
  }
}
