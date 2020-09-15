import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:nylo_framework/helpers/helper.dart';
import 'package:nylo_framework/localization/app_localization.dart';
import 'package:nylo_framework/widgets/stateful_page_widget.dart';

class MyHomePage extends StatefulPageWidget {
  final HomeController controller;
  final String title;

  MyHomePage({Key key, this.title, this.controller}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                getImageAsset("nylo_logo.png"),
                height: 100,
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    getEnv("APP_NAME"),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Micro-framework for Flutter",
                        style: Theme.of(context).accentTextTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          child: Text(
                            trans(context, "documentation").capitalize(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.controller.onTapDocumentation,
                        ),
                        MaterialButton(
                          child: Text(
                            "GitHub",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.controller.onTapGithub,
                        ),
                        MaterialButton(
                          child: Text(
                            trans(context, "changelog").capitalize(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.controller.onTapChangeLog,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
