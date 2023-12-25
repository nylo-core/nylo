import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import 'package:flutter/material.dart';
import '/bootstrap/extensions.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/safearea_widget.dart';
import '/bootstrap/helpers.dart';
import '/app/controllers/home_controller.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static const path = '/home';

  HomePage() : super(path, child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {

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
            children: [
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
                  Divider(),
                  Container(
                    height: 250,
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
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Center(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children:
                        ListTile.divideTiles(context: context, tiles: [
                          MaterialButton(
                            child: Text(
                              "documentation".tr().capitalize(),
                            ).bodyLarge(context).setColor(
                                context, (color) => color.surfaceContent),
                            onPressed: widget.controller.onTapDocumentation,
                          ),
                          MaterialButton(
                            child: Text(
                              "GitHub",
                            ).bodyLarge(context).setColor(
                                context, (color) => color.surfaceContent),
                            onPressed: widget.controller.onTapGithub,
                          ),
                          MaterialButton(
                            child: Text(
                              "changelog".tr().capitalize(),
                            ).bodyLarge(context).setColor(
                                context, (color) => color.surfaceContent),
                            onPressed: widget.controller.onTapChangeLog,
                          ),
                          MaterialButton(
                            child: Text(
                              "YouTube Channel".tr().capitalize(),
                            ).bodyLarge(context).setColor(
                                context, (color) => color.surfaceContent),
                            onPressed: widget.controller.onTapYouTube,
                          ),
                        ]).toList(),
                      ),
                    ),
                  ),
                  Text(
                    "Framework Version: $nyloVersion",
                  )
                      .bodyMedium(context)
                      .setColor(context, (color) => Colors.grey),
                  if (!context.isDarkMode)
                    Switch(
                        value: isThemeDark,
                        onChanged: (_) {
                          NyTheme.set(context,
                              id: getEnv(isThemeDark != true
                                  ? 'DARK_THEME_ID'
                                  : 'LIGHT_THEME_ID'));
                        }),
                  if (!context.isDarkMode)
                    Text("${isThemeDark ? "Dark" : "Light"} Mode"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
          getEnv('DARK_THEME_ID');
}
