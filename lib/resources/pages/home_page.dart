import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MyHomePage extends NyStatefulWidget {
  final HomeController controller = HomeController();
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {
  @override
  widgetDidLoad() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                getImageAsset("nylo_logo.png"),
                height: 100,
                width: 100,
              ),
              Text(
                getEnv("APP_NAME"),
                style: textTheme.headline2,
              ),
              Text(
                "Micro-framework for Flutter",
                style: textTheme.subtitle1!
                    .copyWith(color: NyColors.light.primaryAccent),
                textAlign: TextAlign.center,
              ),
              Text(
                "Build something amazing 💡️",
                style: textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Divider(),
                  Container(
                    height: 170,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        MaterialButton(
                          child: Text(
                            trans(context, "documentation")!.capitalize(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.controller.onTapDocumentation,
                        ),
                        Divider(
                          height: 0,
                        ),
                        MaterialButton(
                          child: Text(
                            "GitHub",
                            style: textTheme.bodyText1,
                          ),
                          onPressed: widget.controller.onTapGithub,
                        ),
                        Divider(
                          height: 0,
                        ),
                        MaterialButton(
                          child: Text(
                            trans(context, "changelog")!.capitalize(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.controller.onTapChangeLog,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    nyloVersion,
                    style: textTheme.bodyText2!.copyWith(color: Colors.grey),
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
