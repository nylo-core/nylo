import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {

  HomeController.of(BuildContext context) {
    super.context = context;
  }

  onTapDocumentation() {
    launch("https://nylo.dev/docs");
  }

  onTapGithub() {
    launch("https://github.com/nylo-core/nylo");
  }

  onTapChangeLog() {
    launch("https://github.com/nylo-core/framework/blob/1.x/CHANGELOG.md");
  }
}
