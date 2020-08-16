import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/base_api_service.dart';
import 'package:nylo_framework/metro/controllers/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends Controller {

  HomeController.of(BuildContext context) {
    super.context = context;
  }

  onTapDocumentation() {
    launch("https://nylo.dev/docs/1x");
  }

  onTapGithub() {
    launch("https://github.com/nylo-core/nylo");
  }

  onTapChangeLog() {
    launch("https://github.com/nylo-core/framework/changelog");
  }
}
