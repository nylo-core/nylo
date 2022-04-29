import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (getEnv('APP_DEBUG') == true) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (getEnv('APP_DEBUG') == true) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions
              .path}');
      print('DATA: ${response.requestOptions.path}');
      log(response.data.toString());
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (getEnv('APP_DEBUG') == true) {
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions
          .path}');
    }
    handler.next(err);
  }
}
