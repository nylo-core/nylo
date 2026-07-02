import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Auth Route Guard
|--------------------------------------------------------------------------
| Checks if the User is authenticated.
|
| * [Tip] Create new route guards using the CLI 🚀
| Run the below in the terminal to create a new route guard.
| "metro make:route_guard check_subscription"
|
| Learn more https://nylo.dev/docs/7.x/router#route-guards
|-------------------------------------------------------------------------- */

class AuthRouteGuard extends NyRouteGuard {
  AuthRouteGuard();

  @override
  Future<GuardResult> onBefore(RouteContext<dynamic> context) async {
    // context.data - data passed to the route
    // context.queryParameters - query parameters from the URL
    // context.routeName - the route being navigated to

    bool isLoggedIn = await Auth.isAuthenticated();
    if (!isLoggedIn) {
      return redirect(HomePage.path);
    }

    return next();
  }
}
