import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_support/helpers/helper.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme
|
| Theme Config - config/app_theme.dart
|--------------------------------------------------------------------------
*/

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
      accentTextTheme: defaultTextTheme.merge(_darkTextTheme(appTheme)).apply(
        bodyColor: appTheme.accentColor(brightness: Brightness.dark),
        displayColor: appTheme.accentColor(brightness: Brightness.dark),
      ),
      focusColor: appTheme.accentColor(brightness: Brightness.dark),
      scaffoldBackgroundColor:
          appTheme.scaffoldColor(brightness: Brightness.dark),
      hintColor: appTheme.secondColor(brightness: Brightness.dark),
      appBarTheme: AppBarTheme(
        textTheme: getAppTextTheme(appThemeFont, defaultTextTheme.merge(_darkTextTheme(appTheme))),
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
      textTheme: getAppTextTheme(appThemeFont, defaultTextTheme.merge(_darkTextTheme(appTheme))),
    );

TextTheme _darkTextTheme(AppTheme appTheme) {
  return TextTheme(
    headline5: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    headline4: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    headline3: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    headline2: TextStyle(
      color: appTheme.mainColor(brightness: Brightness.dark),
    ),
    headline1: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    subtitle2: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    subtitle1: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    overline: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    button: TextStyle(
      color: Colors.white,
    ),
    headline6: TextStyle(
      color: appTheme.mainColor(brightness: Brightness.dark),
    ),
    bodyText2: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    bodyText1: TextStyle(
      color: appTheme.secondColor(brightness: Brightness.dark),
    ),
    caption: TextStyle(
      color: appTheme.accentColor(brightness: Brightness.dark),
    ),
  );
}