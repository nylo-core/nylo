import 'package:flutter_app/app/middleware/admin_middleware.dart';
import 'package:flutter_app/app/middleware/auth_middleware.dart';

Map<String, dynamic> register() {
  return {
    'auth': new AuthMiddleware(),
    'admin': new AdminMiddleware(),
  };
}
