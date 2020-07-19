import 'package:flutter/cupertino.dart';
import 'package:flutter_app/routes/router.dart';

class AuthMiddleware {
  AuthMiddleware();

  void handle(
    BuildContext context,
    Object request,
  ) {
    if (request == null) {
      return router().getRouteNamed("app.error");
    }
    if (Map.of(request)["index"] == 22) {
      return null;
    } else {
      return router().getRouteNamed("app.error");
    }
  }
}
