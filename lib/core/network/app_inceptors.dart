import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors() : super();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }

    /// this condition is to forward the request for directions to the propper

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      print(
        'REQUEST[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'REQUEST[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
    }
    super.onError(err, handler);
  }
}
