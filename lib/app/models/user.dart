import 'package:nylo_support/helpers/helper.dart';

class User extends Storable {

  // 👤 It all starts with a user
  late String name; // name
  late String token; // authentication token

  @override
  toStorage() => {
    "name": this.name,
    "token": this.token
  };

  @override
  fromStorage(dynamic data) {
    this.name = data['name'];
    this.token = data['token'];
  }
}
