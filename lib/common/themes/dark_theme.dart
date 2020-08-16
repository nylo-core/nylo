import 'package:flutter/material.dart';
import 'package:flutter_app/common/themes/theme_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nylo_framework/helpers/helper.dart';

TextTheme _defaultTextTheme = TextTheme(
  headline5: TextStyle(
    fontSize: 22.0,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  headline4: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  headline3: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  headline2: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    color: AppTheme().mainColor(brightness: Brightness.dark),
  ),
  headline1: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w300,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  subtitle1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  button: TextStyle(
    color: Colors.white,
  ),
  headline6: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppTheme().mainColor(brightness: Brightness.dark),
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    color: AppTheme().secondColor(brightness: Brightness.dark),
  ),
  caption: TextStyle(
    fontSize: 16.0,
    color: AppTheme().accentColor(brightness: Brightness.dark),
  ),
);

ThemeData darkTheme() => ThemeData(
      primaryColor: AppTheme().mainColor(brightness: Brightness.dark),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      accentColor: AppTheme().accentColor(brightness: Brightness.dark),
      primaryColorLight: AppTheme().accentColor(
        brightness: Brightness.light,
      ),
      primaryColorDark: AppTheme().accentColor(
        brightness: Brightness.dark,
      ),
      accentColorBrightness: Brightness.dark,
      accentTextTheme: _defaultTextTheme.apply(
        bodyColor: AppTheme().accentColor(brightness: Brightness.dark),
        displayColor: AppTheme().accentColor(brightness: Brightness.dark),
      ),
      focusColor: AppTheme().accentColor(brightness: Brightness.dark),
      scaffoldBackgroundColor:
          AppTheme().scaffoldColor(brightness: Brightness.dark),
      hintColor: AppTheme().secondColor(brightness: Brightness.dark),
      appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.latoTextTheme(_defaultTextTheme),
        color:
            AppTheme().scaffoldColor(brightness: Brightness.dark, opacity: 0.5),
        iconTheme: IconThemeData(
            color: AppTheme().mainColor(brightness: Brightness.dark)),
        elevation: 1.0,
        brightness: Brightness.dark,
      ),
      buttonColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppTheme().accentColor(),
      ),
      textTheme: getAppTextTheme(appThemeFont, _defaultTextTheme),
    );
