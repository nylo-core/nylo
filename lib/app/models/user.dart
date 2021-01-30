import 'package:nylo_framework/helpers/helper.dart';

class User extends Storable {
  // 👤
  // It all starts with a user
  String token; // authentication token

  @override
  toStorage() => {
    "token": this.token
  };

  @override
  fromStorage(dynamic data) {
    this.token = data['token'];
  }
}
