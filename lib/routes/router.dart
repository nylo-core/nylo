import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/common/pages/home_page.dart';
import 'package:nylo_framework/router/router.dart';

buildRouter() => nyCreateRoutes((router) {

  router.addRoute(NyRoute(
        name: "/",
        view: (context) => MyHomePage(
          title: "Hello World",
          controller: HomeController.of(context),
        ),
      ));


});
