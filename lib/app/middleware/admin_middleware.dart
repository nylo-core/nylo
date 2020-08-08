import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/middleware/middleware.dart';
import 'package:flutter_app/routes/router.dart';

class AdminMiddleware implements Middleware {
  AdminMiddleware();

  @override
  void handle(
    BuildContext context,
    Object request,
  ) {
    if (Map.of(request)["index"] == 22) {
      return null;
    } else {
//      return router().getRouteNamed("landing.error");
    }
  }
}
