import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:nylo_support/router/router.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| // Run the below in the terminal to create new a page and controller.
| // "flutter pub run nylo_framework:main make:page my_page -c"
| // Learn more https://nylo.dev/docs/1.x/router
|--------------------------------------------------------------------------
*/

buildRouter() => nyCreateRoutes((router) {

      router.route("/", (context) => MyHomePage(
                title: "Hello World",
              ));

      // Add your routes here

      // router.route("/new-page", (context) => NewPage());

    });
