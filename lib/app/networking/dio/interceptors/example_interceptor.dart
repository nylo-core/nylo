import 'package:nylo_framework/nylo_framework.dart';

class ExampleInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
