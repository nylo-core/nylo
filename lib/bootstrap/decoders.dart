import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/home_controller.dart';
import '/app/models/github_repo.dart';
import '/app/models/user.dart';
import '/app/networking/api_service.dart';

/* Model Decoders
|--------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models. Add one line per model: Decode(User.fromJson) decodes a User,
| and a List<User> too. Plain JSON types, such as Map<String, dynamic>,
| need no entry.
|
| Learn more https://nylo.dev/docs/7.x/decoders#model-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> modelDecoders = decoders([
  Decode(User.fromJson),

  /* OneOf
  | Decodes a response that can have more than one shape. GitHub returns
  | the repo on a 200, and {"message": ...} for anything else.
  |-------------------------------------------------------------------------- */

  // By the response's status code
  OneOf<GithubRepoResult>.byStatus({
    200: GithubRepo.fromJson,
  }, otherwise: GithubError.fromJson),

]);

/* API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
|
| Learn more https://nylo.dev/docs/7.x/decoders#api-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> apiDecoders = {
  ApiService: () => ApiService(),

  // ...
};

/* Controller Decoders
| -------------------------------------------------------------------------
| Controller are used in pages.
|
| Learn more https://nylo.dev/docs/7.x/controllers
|-------------------------------------------------------------------------- */
final Map<Type, dynamic> controllers = {
  HomeController: () => HomeController(),

  // ...
};
