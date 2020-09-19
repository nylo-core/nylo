import 'package:flutter_app/app/networking/api_service.dart';
import 'package:nylo_framework/controllers/controller.dart';

class Controller extends BaseController {
  ApiService apiService;

  Controller({this.apiService}) {
    if (this.apiService == null) {
      this.apiService = ApiService();
    }
  }
}
