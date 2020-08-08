import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/networking/services/base_url_api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeInterface {
  BaseUrlApiService baseUrlApiService;

  HomeInterface(this._context) : baseUrlApiService = BaseUrlApiService();

  BuildContext _context;

  onTapDocumentation() {
    launch("http://woosignal.uk");
  }

  onTapGithub() {
    launch("https://github.com/woosignal");
  }

  onTapChangeLog() {
    Navigator.of(_context).pushNamed("/change-log");
  }

//  Future<GoogleLocation> fetchGoogleLocation() {
//    return this.baseUrlApiService.fetchGoogleLocation();
//  }
}
