import 'package:flutter_app/app/networking/base_networking.dart';

abstract class NyApi {
  String _url();
}

class BaseUrlApiService extends NyApi {
  var _client;
  BaseNetworking _baseNetworking;

  BaseUrlApiService() {
    _baseNetworking = BaseNetworking();
//    String toke =  await NySecureStoage('sdsdjnskjcn');
  }

  String _url() {
    return _baseNetworking.getUrl(tag: "base_url");
  }

  fetchChangeLog() async {
    try {
      var uriResponse = await _client.get(this._url() + '/changelog');
      return await _client.get(uriResponse);
    } finally {
      _client.close();
    }
  }
}
