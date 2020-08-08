import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:nylo_framework/metro/helpers/tools.dart';

class BaseApi {

  BaseApi();

  debugHttpLogger(Response response) async {
    bool debug = DotEnv().env['APP_DEBUG'] == 'true' ? true : false;

    if (debug) {
      NyLogger()
          .addLn("[API ${response.request.method.toUpperCase()} REQUEST]")
          .addLn("[URL] : " + response.request.url.toString())
          .addLn("[HEADERS] : " + response.headers.toString())
          .addLn("[BODY] : " + response.body.toString())
          .addLn("[STATUS CODE] : " + response.statusCode.toString());
    }
  }
}
