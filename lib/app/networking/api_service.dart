import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/base_api_service.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Uses Dio https://pub.dev/packages/dio
|--------------------------------------------------------------------------
*/

class ApiService extends BaseDioApiService implements HasApiOperations {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => "https://myapi.com";

  // @override
  // BaseOptions get baseOptions => BaseOptions();

  // @override
  // bool get useInterceptor => true;

  Future<Response> fetchTestData() async {
    Response response = await api.get('/users');
    print(response.data.toString());
    return response;
  }
}
