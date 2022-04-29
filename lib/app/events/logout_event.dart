import 'package:nylo_framework/nylo_framework.dart';

class LogoutEvent implements NyEvent {

  final listeners = {
    DefaultListener: DefaultListener()
  };
}

class DefaultListener extends NyListener {
  handle(dynamic event) async {

  }
}