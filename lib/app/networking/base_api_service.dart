import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class HasApiOperations {
  String get baseUrl;
  BaseOptions? get baseOptions;
  bool? get useInterceptor;
}

class BaseDioApiService {

  late Dio api;
  BuildContext? _context;
  BaseOptions? baseOptions;
  final String baseUrl = "";
  bool useInterceptor = false;

  BaseDioApiService(BuildContext? context) {
    this._context = context;
    this.init();
  }

  void init() {
    baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    api = Dio(baseOptions);

    if (useInterceptor == true) {
      _addInterceptor();
    }
  }

  _addInterceptor() {
    api.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          // Do something before request is sent

          // options.headers = {
          //   "Author": "Bearer: {{ user token }}"
          // };

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse: (response,handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          // Do something with response error

          return  handler.next(e);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        }
    ));
  }
}