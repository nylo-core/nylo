import 'package:flutter_app/app/controllers/index_controller.dart';
import 'package:nylo_framework/router/model/router.dart';
import 'package:nylo_framework/router/router.dart';

/*
|--------------------------------------------------------------------------
| Router
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/

List<AppRoute> routers = [
  AppRoute(
    path: "/",
    action: IndexController().index,
    name: "landing.index",
  ),
  AppRoute(
    path: "/change-log",
    action: IndexController().changeLog,
  ).setName("changelog.index"),
  AppRoute(
    path: "/error",
    action: IndexController().error,
    name: "app.error",
  ),
  AppRoute(path: "/settings", action: IndexController().index),
];

//Router router() {
//  return routes(
//    (router) {
//      return [
//        AppRoute(
//          path: "/",
//          action: IndexController().index,
//          name: "landing.index",
//        ),
//        AppRoute(
//          path: "/change-log",
//          action: IndexController().changeLog,
//        ).setName("changelog.index"),
//        AppRoute(
//          path: "/error",
//          action: IndexController().error,
//          name: "app.error",
//        ),
//        AppRoute(path: "/settings", action: IndexController().index)
//      ];
//    },
//  );
//}
