import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? name;
  String? email;

  User();

  User.fromJson(dynamic data) {
    name = data['name'];
    email = data['email'];
  }

  toJson() => {"name": name, "email": email};
}
