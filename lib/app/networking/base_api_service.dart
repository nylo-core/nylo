import 'dart:convert';
import 'package:nylo_framework/networking/base_networking.dart';
import 'package:http/http.dart';

class BaseApiService extends BaseApi {
  
  var _client;

  BaseApiService() : _client = new Client();

}
