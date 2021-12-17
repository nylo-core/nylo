import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {

  @override
  construct(BuildContext context) {
    super.construct(context);

  }

  onTapDocumentation() async {
    await launch("https://nylo.dev/docs");
  }

  onTapGithub() async {
    await launch("https://github.com/nylo-core/nylo");
  }

  onTapChangeLog() async {
    await launch("https://github.com/nylo-core/framework/blob/2.x/CHANGELOG.md");
  }
}
