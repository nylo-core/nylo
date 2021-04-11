import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {

  @override
  construct(BuildContext context) {

  }

  onTapDocumentation() {
    launch("https://nylo.dev/docs");
  }

  onTapGithub() {
    launch("https://github.com/nylo-core/nylo");
  }

  onTapChangeLog() {
    launch("https://github.com/nylo-core/framework/blob/0.x/CHANGELOG.md");
  }
}
