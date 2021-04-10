import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/helpers/helper.dart';

/*
|--------------------------------------------------------------------------
| Light Theme
|
| Theme Config - config/app_theme.dart
|--------------------------------------------------------------------------
*/

ThemeData lightTheme(AppTheme appTheme) => ThemeData(
      primaryColor: appTheme.mainColor(),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      accentColor: appTheme.accentColor(),
      primaryColorLight: appTheme.accentColor(
        brightness: Brightness.light,
      ),
      primaryColorDark: appTheme.accentColor(
        brightness: Brightness.dark,
      ),
      accentColorBrightness: Brightness.light,
      accentTextTheme: defaultTextTheme.merge(_lightTextTheme(appTheme)).apply(
        bodyColor: appTheme.accentColor(),
        displayColor: appTheme.accentColor(),
      ),
      focusColor: appTheme.accentColor(),
      scaffoldBackgroundColor: appTheme.scaffoldColor(),
      hintColor: appTheme.secondColor(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: getAppTextTheme(appThemeFont, defaultTextTheme.merge(_lightTextTheme(appTheme))),
        iconTheme: IconThemeData(color: appTheme.mainColor()),
        elevation: 1.0,
        brightness: Brightness.light,
      ),
      buttonColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: appTheme.accentColor(),
      ),
      textTheme: getAppTextTheme(appThemeFont, defaultTextTheme.merge(_lightTextTheme(appTheme))),
    );


TextTheme _lightTextTheme(AppTheme appTheme) {
  return TextTheme(
    headline5: TextStyle(
      color: appTheme.secondColor(),
    ),
    headline4: TextStyle(
      color: appTheme.secondColor(),
    ),
    headline3: TextStyle(
      color: appTheme.secondColor(),
    ),
    headline2: TextStyle(
      color: appTheme.mainColor(),
    ),
    headline1: TextStyle(
      color: appTheme.secondColor(),
    ),
    subtitle2: TextStyle(
      color: appTheme.secondColor(),
    ),
    subtitle1: TextStyle(
      color: appTheme.secondColor(),
    ),
    overline: TextStyle(
      color: appTheme.secondColor(),
    ),
    button: TextStyle(
      color: Colors.white,
    ),
    headline6: TextStyle(
      color: appTheme.mainColor(),
    ),
    bodyText2: TextStyle(
      color: appTheme.secondColor(),
    ),
    bodyText1: TextStyle(
      color: appTheme.secondColor(),
    ),
    caption: TextStyle(
      color: appTheme.accentColor(),
    ),
  );
}