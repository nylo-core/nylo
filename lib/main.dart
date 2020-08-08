import 'package:flutter/material.dart';
import 'package:flutter_app/config/app.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DotEnv().load('.env');

  runApp(
    AppBuild(
      initialRoute: Router().addRoutes(routes: routers).getInitialRoute(),
      onGenerateRoute: Router().addRoutes(routes: routers).buildAppRoutes,
    ),
  );
}
