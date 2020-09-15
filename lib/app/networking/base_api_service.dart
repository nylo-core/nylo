import 'dart:convert';
import 'package:nylo_framework/networking/base_networking.dart';
import 'package:http/http.dart';

class ApiService extends BaseApi {
  var _client;

  ApiService() : _client = new Client();
}
