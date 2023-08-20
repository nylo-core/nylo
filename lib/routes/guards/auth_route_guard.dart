import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../router.dart';

/*
|--------------------------------------------------------------------------
| Auth Route Guard
|
| Checks if the User is authenticated.
| Learn more https://nylo.dev/docs/5.x/router#route-guards
|--------------------------------------------------------------------------
*/

class AuthRouteGuard extends NyRouteGuard {
  AuthRouteGuard();

  @override
  Future<bool> canOpen(BuildContext? context, NyArgument? data) async {
    return (await Auth.loggedIn());
  }

  @override
  redirectTo(BuildContext? context, NyArgument? data) async {
    await routeTo(App.home);
  }
}
