import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:nylo_framework/helpers/helper.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme
|
| Theme Config - config/app_theme.dart
|--------------------------------------------------------------------------
*/

TextTheme _defaultTextTheme(AppTheme appTheme) {
  return TextTheme(
    headline5: TextStyle(
      fontSize: 22.0,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    headline4: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    headline3: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    headline2: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: appTheme.mainColor(brightness: Brightness.dark),
    ),
    headline1: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w300,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    subtitle2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    overline: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    button: TextStyle(
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: appTheme.mainColor(brightness: Brightness.dark),
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    caption: TextStyle(
      fontSize: 16.0,
      color: appTheme.accentColor(brightness: Brightness.dark),
    ),
  );
}

ThemeData darkTheme(AppTheme appTheme) => ThemeData(
      primaryColor: appTheme.mainColor(brightness: Brightness.dark),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      accentColor: appTheme.accentColor(brightness: Brightness.dark),
      primaryColorLight: appTheme.accentColor(
        brightness: Brightness.light,
      ),
      primaryColorDark: appTheme.accentColor(
        brightness: Brightness.dark,
      ),
      accentColorBrightness: Brightness.dark,
      accentTextTheme: _defaultTextTheme(appTheme).apply(
        bodyColor: appTheme.accentColor(brightness: Brightness.dark),
        displayColor: appTheme.accentColor(brightness: Brightness.dark),
      ),
      focusColor: appTheme.accentColor(brightness: Brightness.dark),
      scaffoldBackgroundColor:
          appTheme.scaffoldColor(brightness: Brightness.dark),
      hintColor: appTheme.secondColor(brightness: Brightness.dark),
      appBarTheme: AppBarTheme(
        textTheme: getAppTextTheme(appThemeFont, _defaultTextTheme(appTheme)),
        color:
            appTheme.scaffoldColor(brightness: Brightness.dark, opacity: 0.5),
        iconTheme: IconThemeData(
            color: appTheme.mainColor(brightness: Brightness.dark)),
        elevation: 1.0,
        brightness: Brightness.dark,
      ),
      buttonColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: appTheme.accentColor(),
      ),
      textTheme: getAppTextTheme(appThemeFont, _defaultTextTheme(appTheme)),
    );
