import 'package:flutter_app/app/events/login_event.dart';
import 'package:flutter_app/app/events/logout_event.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Events
| Add your "app/events" here.
| Events can be fired using: event<MyEvent>();
|
| Learn more: https://nylo.dev/docs/3.x/events
|--------------------------------------------------------------------------
*/

final Map<Type, NyEvent> events = {
  LoginEvent: LoginEvent(),
  LogoutEvent: LogoutEvent(),
};