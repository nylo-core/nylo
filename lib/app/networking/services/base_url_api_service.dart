import 'dart:convert';
import '../base_api.dart';
import 'package:http/http.dart';


class BaseUrlApiService extends BaseApi {
  
  var _client;

  BaseUrlApiService() : _client = new Client();

  
}
