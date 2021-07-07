import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/resources/themes/dark_theme.dart';
import 'package:flutter_app/resources/themes/light_theme.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_support/localization/app_localization.dart';
import 'package:nylo_support/nylo.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppTheme appTheme = AppTheme();

  Nylo nylo = await initNylo(theme: lightTheme(appTheme), router: buildRouter());

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
