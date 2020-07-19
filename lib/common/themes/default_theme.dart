import 'package:flutter/material.dart';
import 'package:flutter_app/common/themes/default_theme_colors.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme _defaultTextTheme = TextTheme(
  headline5: TextStyle(
    fontSize: 22.0,
    color: AppColors().secondColor(),
  ),
  headline4: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors().secondColor(),
  ),
  headline3: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    color: AppColors().secondColor(),
  ),
  headline2: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    color: AppColors().mainColor(),
  ),
  headline1: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w300,
    color: AppColors().secondColor(),
  ),
  subtitle1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors().secondColor(),
  ),
  button: TextStyle(
    color: Colors.white,
  ),
  headline6: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors().mainColor(),
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    color: AppColors().secondColor(),
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    color: AppColors().secondColor(),
  ),
  caption: TextStyle(
    fontSize: 16.0,
    color: AppColors().accentColor(),
  ),
);

ThemeData defaultTheme() => ThemeData(
      primaryColor: AppColors().mainColor(),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      accentColor: AppColors().accentColor(),
      primaryColorLight: AppColors().accentColor(
        brightness: Brightness.light,
      ),
      primaryColorDark: AppColors().accentColor(
        brightness: Brightness.dark,
      ),
      accentColorBrightness: Brightness.light,
      accentTextTheme: _defaultTextTheme.apply(
        bodyColor: AppColors().accentColor(),
        displayColor: AppColors().accentColor(),
      ),
      focusColor: AppColors().accentColor(),
      scaffoldBackgroundColor: AppColors().scaffoldColor(),
      hintColor: AppColors().secondColor(),
      appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.latoTextTheme(_defaultTextTheme),
        color: Colors.white,
        iconTheme: IconThemeData(color: AppColors().mainColor()),
        elevation: 1.0,
        brightness: Brightness.light,
      ),
      buttonColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors().accentColor(),
      ),
      textTheme: GoogleFonts.latoTextTheme(_defaultTextTheme),
    );
