import 'package:nylo_framework/nylo_framework.dart';

class User extends Storable {
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
