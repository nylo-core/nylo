import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import '/app/controllers/home_controller.dart';
import '/bootstrap/helpers.dart';
import '/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

class HomePage extends NyStatefulWidget {
  @override
  final HomeController controller = HomeController();

  static const path = '/home-page';

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends NyState<HomePage> {
  bool _darkMode = false;

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World".tr()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.controller.showAbout,
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(),
              Text(
                getEnv("APP_NAME"),
              ).displayMedium(context),
              Text("Micro-framework for Flutter", textAlign: TextAlign.center)
                  .titleMedium(context)
                  .setColor(context, (color) => color.primaryAccent),
              Text(
                "Build something amazing 💡",
              ).bodyMedium(context).alignCenter(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: ThemeColor.get(context)
                            .appBarBackground
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Center(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          MaterialButton(
                            child: Text(
                              "documentation".tr().capitalize(),
                            ).bodyLarge(context),
                            onPressed: widget.controller.onTapDocumentation,
                          ),
                          MaterialButton(
                            child: Text(
                              "GitHub",
                            ).bodyLarge(context),
                            onPressed: widget.controller.onTapGithub,
                          ),
                          MaterialButton(
                            child: Text(
                              "changelog".tr().capitalize(),
                            ).bodyLarge(context),
                            onPressed: widget.controller.onTapChangeLog,
                          ),
                          MaterialButton(
                            child: Text(
                              "YouTube Channel".tr().capitalize(),
                            ).bodyLarge(context),
                            onPressed: widget.controller.onTapYouTube,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Framework Version: $nyloVersion",
                  )
                      .bodyMedium(context)
                      .setColor(context, (color) => Colors.grey),
                  Switch(
                      value: _darkMode,
                      onChanged: (value) {
                        _darkMode = value;
                        NyTheme.set(context,
                            id: getEnv(_darkMode == true
                                ? 'DARK_THEME_ID'
                                : 'LIGHT_THEME_ID'));
                        setState(() {});
                      }),
                  Text("${_darkMode == true ? "Dark" : "Light"} Mode"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
