import 'package:flutter_app/config/events.dart';
import 'package:nylo_framework/nylo_framework.dart';

class EventProvider implements NyProvider {

  @override
  boot(Nylo nylo) async {
    nylo.addEvents(events);

    return nylo;
  }
}