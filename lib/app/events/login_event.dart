import 'package:nylo_framework/nylo_framework.dart';

class LoginEvent implements NyEvent {
  @override
  final listeners = {
    DefaultListener: DefaultListener(),
  };
}

class DefaultListener extends NyListener {
  @override
  handle(dynamic event) async {
    // handle the payload from event
  }
}
