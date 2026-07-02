import '/config/storage_keys.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BearerAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dynamic authData = Auth.data();
    if (authData == null) return super.onRequest(options, handler);
    final dynamic token = authData['token'];
    if (token != null && token.toString().isNotEmpty) {
      options.headers.addAll(<String, dynamic>{"Authorization": "Bearer $token"});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await Auth.logout();
      routeToInitial();
    }
    handler.next(err);
  }
}
