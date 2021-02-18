import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/resources/themes/dark_theme.dart';
import 'package:flutter_app/resources/themes/default_theme.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/localization/app_localization.dart';
import 'package:nylo_framework/nylo.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme appTheme = AppTheme();

  Nylo nylo = await initNylo(theme: defaultTheme(appTheme), router: buildRouter());

  runApp(
    AppBuild(
      navigatorKey: nylo.router.navigatorKey,
      onGenerateRoute: nylo.router.generator(),
      themeData: CurrentTheme.instance.theme,
      darkTheme: darkTheme(appTheme),
      locale: AppLocale.instance.locale,
    ),
  );
}
