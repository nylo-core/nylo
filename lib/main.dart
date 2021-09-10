import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/resources/themes/dark_theme.dart';
import 'package:flutter_app/resources/themes/light_theme.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/nylo_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(router: buildRouter());

  runApp(
    AppBuild(
      navigatorKey: nylo.router!.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      lightTheme: lightTheme(),
      darkTheme: darkTheme(),
      locale: AppLocale.instance.locale,
    ),
  );
}
