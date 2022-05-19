
class User {
  late String name;
  late String email;

  User.fromJson(dynamic data) {
    name = data['name'];
    email = data['email'];
  }

  toJson()  => {
    "name": name,
    "email": email
  };
}