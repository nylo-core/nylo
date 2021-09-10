import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Light Theme
|
| Theme Config - config/app_theme.dart
|--------------------------------------------------------------------------
*/

ThemeData lightTheme() {
  TextTheme lightTheme =
      getAppTextTheme(appThemeFont, defaultTextTheme.merge(_lightTextTheme()));
  return ThemeData(
    primaryColor: NyColors.light.primaryContent,
    backgroundColor: NyColors.light.background,
    colorScheme: ColorScheme.light(),
    primaryColorLight: NyColors.light.primaryAccent,
    primaryColorDark: NyColors.dark.primaryContent,
    focusColor: NyColors.light.primaryContent,
    scaffoldBackgroundColor: NyColors.light.background,
    hintColor: NyColors.light.primaryAccent,
    appBarTheme: AppBarTheme(
        backgroundColor: NyColors.light.appBarBackground,
        titleTextStyle: lightTheme.headline6!
            .copyWith(color: NyColors.light.appBarPrimaryContent),
        iconTheme: IconThemeData(color: NyColors.dark.appBarPrimaryContent),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    buttonTheme: ButtonThemeData(
        buttonColor: NyColors.light.buttonPrimaryContent,
        colorScheme:
            ColorScheme.light(primary: NyColors.light.buttonBackground)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: NyColors.light.primaryContent)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            primary: NyColors.light.buttonPrimaryContent,
            backgroundColor: NyColors.light.buttonBackground)),
    textTheme: lightTheme,
  );
}

/*
|--------------------------------------------------------------------------
| Light Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _lightTextTheme() {
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
      color: NyColors.light.primaryContent,
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
      color: NyColors.light.primaryContent,
    ),
    bodyText2: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    bodyText1: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    caption: TextStyle(
      color: NyColors.light.primaryAccent,
    ),
  );
}
