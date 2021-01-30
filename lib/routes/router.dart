import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_framework/router/router.dart';

/*
|--------------------------------------------------------------------------
| App Router
|--------------------------------------------------------------------------
*/

buildRouter() => nyCreateRoutes((router) {

      router.route("/", (context) => MyHomePage(
        title: "Hello World",
      ));

      // Add your routes here

    });
