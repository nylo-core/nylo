import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

class MyHomePage extends NyStatefulWidget {
  final HomeController controller = HomeController();
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {

  bool _darkMode = false;

  @override
  widgetDidLoad() async {

  }

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
                style: textTheme.subtitle1!.setColor(context, (color) => color.primaryAccent),
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
                        color: ThemeColor.get(context).surfaceBackground,
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
                            "documentation".tr().capitalize(),
                            style: Theme.of(context).textTheme.bodyText1!.setColor(context, (color) => color.surfaceContent),
                          ),
                          onPressed: widget.controller.onTapDocumentation,
                        ),
                        Divider(
                          height: 0,
                        ),
                        MaterialButton(
                          child: Text(
                            "GitHub",
                            style: textTheme.bodyText1!.setColor(context, (color) => color.surfaceContent),
                          ),
                          onPressed: widget.controller.onTapGithub,
                        ),
                        Divider(
                          height: 0,
                        ),
                        MaterialButton(
                          child: Text(
                            "changelog".tr().capitalize(),
                            style: Theme.of(context).textTheme.bodyText1!.setColor(context, (color) => color.surfaceContent),
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
                  Switch(value: _darkMode, onChanged: (value) {
                    _darkMode = value;
                    NyTheme.set(context, id: (_darkMode == true ? 'default_dark_theme' : 'default_light_theme'));
                    setState(() {});
                  }),
                  Text("${_darkMode == true ? "Dark": "Light"} Mode"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}