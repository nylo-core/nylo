import 'package:flutter/material.dart';
import 'package:flutter_app/common/themes/theme_config.dart';
import 'package:nylo_framework/helpers/helper.dart';

TextTheme _defaultTextTheme = TextTheme(
  headline5: TextStyle(
    fontSize: 22.0,
    color: AppTheme().secondColor(),
  ),
  headline4: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppTheme().secondColor(),
  ),
  headline3: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    color: AppTheme().secondColor(),
  ),
  headline2: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    color: AppTheme().mainColor(),
  ),
  headline1: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w300,
    color: AppTheme().secondColor(),
  ),
  subtitle2: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppTheme().secondColor(),
  ),
  subtitle1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppTheme().secondColor(),
  ),
  overline: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: AppTheme().secondColor(),
  ),
  button: TextStyle(
    color: Colors.white,
  ),
  headline6: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppTheme().mainColor(),
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    color: AppTheme().secondColor(),
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    color: AppTheme().secondColor(),
  ),
  caption: TextStyle(
    fontSize: 16.0,
    color: AppTheme().accentColor(),
  ),
);

ThemeData defaultTheme() => ThemeData(
      primaryColor: AppTheme().mainColor(),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      accentColor: AppTheme().accentColor(),
      primaryColorLight: AppTheme().accentColor(
        brightness: Brightness.light,
      ),
      primaryColorDark: AppTheme().accentColor(
        brightness: Brightness.dark,
      ),
      accentColorBrightness: Brightness.light,
      accentTextTheme: _defaultTextTheme.apply(
        bodyColor: AppTheme().accentColor(),
        displayColor: AppTheme().accentColor(),
      ),
      focusColor: AppTheme().accentColor(),
      scaffoldBackgroundColor: AppTheme().scaffoldColor(),
      hintColor: AppTheme().secondColor(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: getAppTextTheme(appThemeFont, _defaultTextTheme),
        iconTheme: IconThemeData(color: AppTheme().mainColor()),
        elevation: 1.0,
        brightness: Brightness.light,
      ),
      buttonColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppTheme().accentColor(),
      ),
      textTheme: getAppTextTheme(appThemeFont, _defaultTextTheme),
    );
