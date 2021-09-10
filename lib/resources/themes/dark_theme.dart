import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme
|
| Theme Config - config/app_theme.dart
|--------------------------------------------------------------------------
*/

ThemeData darkTheme() {
  TextTheme darkTheme = getAppTextTheme(appThemeFont, defaultTextTheme.merge(_darkTextTheme()));
  return ThemeData(
    primaryColor: NyColors.light.primaryContent,
    backgroundColor: NyColors.dark.background,
    colorScheme: ColorScheme.light(),
    primaryColorLight: NyColors.light.primaryAccent,
    primaryColorDark: NyColors.dark.primaryContent,
    focusColor: NyColors.dark.primaryContent,
    scaffoldBackgroundColor: NyColors.dark.background,
    hintColor: NyColors.light.primaryAccent,
    appBarTheme: AppBarTheme(
        backgroundColor: NyColors.dark.appBarBackground,
        titleTextStyle: darkTheme.headline6!.copyWith(color: NyColors.dark.appBarPrimaryContent),
        iconTheme: IconThemeData(color: NyColors.light.appBarPrimaryContent),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light
    ),
      buttonTheme: ButtonThemeData(
      buttonColor: NyColors.dark.primaryAccent,
  colorScheme: ColorScheme.light(primary: NyColors.dark.buttonBackground)
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
  primary: NyColors.dark.primaryContent
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(style: TextButton.styleFrom(
  primary: NyColors.dark.buttonPrimaryContent,
  backgroundColor: NyColors.dark.buttonBackground
  )),
    textTheme: darkTheme,
  );
}

/*
|--------------------------------------------------------------------------
| Dark Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _darkTextTheme() {
  return TextTheme(
    headline5: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    headline4: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    headline3: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    headline2: TextStyle(
      color: NyColors.dark.primaryContent,
    ),
    headline1: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    subtitle2: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    subtitle1: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    overline: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    button: TextStyle(
      color: NyColors.dark.primaryContent,
    ),
    headline6: TextStyle(
      color: NyColors.dark.primaryContent,
    ),
    bodyText2: TextStyle(
      color: NyColors.dark.primaryContent,
    ),
    bodyText1: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    caption: TextStyle(
      color: NyColors.dark.primaryContent,
    ),
  );
}