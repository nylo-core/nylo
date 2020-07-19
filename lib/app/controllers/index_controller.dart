import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/app/interface/changelog_interface.dart';
import 'package:flutter_app/app/interface/home_interface.dart';
import 'package:flutter_app/common/pages/changelog_page.dart';
import 'package:flutter_app/common/pages/error_page.dart';
import 'package:flutter_app/common/pages/home_page.dart';
import 'package:nylo_framework/view/ny_view.dart';

class IndexController extends Controller {

  IndexController();

  Widget index() {
    return view(
      (context, data) => MyHomePage(
        title: "Welcome",
        interface: HomeInterface(context),
      ),
    );
  }

  Widget changeLog() {
    return view(
      (context, data) => ChangeLogPage(
        title: "ChangeLog",
        interface: ChangeLogPageInterface(context),
      ),
    );
  }

  Widget error() {
    return view(
      (context, data) => ErrorPage(
        title: "Error",
        data: data,
      ),
    );
  }

  Widget github() {
    return view((context, data) => ChangeLogPage());
  }
}
