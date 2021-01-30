import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {
  onTapDocumentation() {
    launch("https://nylo.dev/docs");
  }

  onTapGithub() {
    launch("https://github.com/nylo-core/nylo");
  }

  onTapChangeLog() async {
    launch("https://github.com/nylo-core/framework/blob/0.x/CHANGELOG.md");
  }
}
