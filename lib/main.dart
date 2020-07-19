import 'package:flutter/material.dart';
import 'package:flutter_app/config/app.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/nylo_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initMain(preferredOrientations: ConfigApp.instance.deviceOrientations);

  runApp(
    AppBuild(
      initialRoute: router().getInitialRoute(),
      appBuildSettings: ConfigApp.instance.toAppSettings(),
      onGenerateRoute: router().buildAppRoutes,
    ),
  );
}
