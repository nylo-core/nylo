import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/common/themes/dark_theme.dart';
import 'package:flutter_app/common/themes/default_theme.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/localization/app_localization.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/router/router.dart';
import 'package:nylo_framework/theme/helper/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initNylo(theme: defaultTheme());

  NyRouter router = buildRouter();

  runApp(
    AppBuild(
      navigatorKey: router.navigatorKey,
      onGenerateRoute: router.generator(),
      themeData: CurrentTheme.instance.theme,
      darkTheme: darkTheme(),
      locale: AppLocale.instance.locale,
    ),
  );
}
