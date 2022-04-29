import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/api_service.dart';

/*
|--------------------------------------------------------------------------
| Model Decoders
| -------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models. Learn more https://nylo.dev/docs/3.x/decoders#model-decoders
|--------------------------------------------------------------------------
*/

final modelDecoders = {
  List<User>: (data) => List.from(data).map((json) => User.fromJson(json)).toList(),

  User: (data) => User.fromJson(data),

  // User: (data) => User.fromJson(data),

  // ...
};

/*
|--------------------------------------------------------------------------
| API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
| Learn more https://nylo.dev/docs/3.x/decoders#api-decoders
|--------------------------------------------------------------------------
*/

final Map<Type, dynamic> apiDecoders = {
  ApiService: ApiService(),

  // ...

};
