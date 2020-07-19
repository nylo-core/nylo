import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeInterface {
  HomeInterface(this._context);

  BuildContext _context;

  onTapDocumentation() {
    launch("http://woosignal.uk");
  }

  onTapGithub() {
    launch("https://github.com/woosignal");
  }

  onTapChangeLog() {
    Navigator.of(_context).pushNamed("/change-log");
  }
}
