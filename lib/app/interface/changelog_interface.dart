import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/models/change_log.dart';
import 'package:flutter_app/app/networking/services/base_url_api_service.dart';

class ChangeLogPageInterface {
  BaseUrlApiService _baseUrlApiService;

  ChangeLogPageInterface(this._context) {
    _baseUrlApiService = BaseUrlApiService();
  }

  BuildContext _context;

  Future<ChangeLog> fetchChangeLog() async {
    return await _baseUrlApiService.fetchChangeLog();
  }

  onTapGithub() {
    Navigator.of(_context).pushNamed("/about");
  }

  onTapChangeLog() {
    Navigator.of(_context).pushNamed("/about");
  }
}
