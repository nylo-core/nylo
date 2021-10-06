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
  final Color lightPrimaryContent = NyColors.light.primaryContent;
  final Color darkPrimaryContent = NyColors.dark.primaryContent;

  return ThemeData(
    primaryColor: lightPrimaryContent,
    backgroundColor: NyColors.light.background,
    colorScheme: ColorScheme.light(),
    primaryColorLight: NyColors.light.primaryAccent,
    primaryColorDark: darkPrimaryContent,
    focusColor: lightPrimaryContent,
    scaffoldBackgroundColor: NyColors.light.background,
    hintColor: NyColors.light.primaryAccent,
    appBarTheme: AppBarTheme(
      backgroundColor: NyColors.light.appBarBackground,
      titleTextStyle: lightTheme.headline6!
          .copyWith(color: NyColors.light.appBarPrimaryContent),
      iconTheme: IconThemeData(color: NyColors.light.appBarPrimaryContent),
      elevation: 1.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: NyColors.light.buttonPrimaryContent,
      colorScheme: ColorScheme.light(primary: NyColors.light.buttonBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: lightPrimaryContent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          primary: NyColors.light.buttonPrimaryContent,
          backgroundColor: NyColors.light.buttonBackground),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: NyColors.light.bottomTabBarBackground,
      unselectedIconTheme:
          IconThemeData(color: NyColors.light.bottomTabBarIconUnselected),
      selectedIconTheme:
          IconThemeData(color: NyColors.light.bottomTabBarIconSelected),
      unselectedLabelStyle:
          TextStyle(color: NyColors.light.bottomTabBarLabelUnselected),
      selectedLabelStyle:
          TextStyle(color: NyColors.light.bottomTabBarLabelSelected),
      selectedItemColor: NyColors.light.bottomTabBarLabelSelected,
    ),
    textTheme: lightTheme,
  );
}

/*
|--------------------------------------------------------------------------
| Light Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _lightTextTheme() {
  final Color lightPrimaryContent = NyColors.light.primaryContent;
  return TextTheme(
    headline6: TextStyle(
      color: lightPrimaryContent,
    ),
    headline5: TextStyle(
      color: lightPrimaryContent,
    ),
    headline4: TextStyle(
      color: lightPrimaryContent,
    ),
    headline3: TextStyle(
      color: lightPrimaryContent,
    ),
    headline2: TextStyle(
      color: lightPrimaryContent,
    ),
    headline1: TextStyle(
      color: lightPrimaryContent,
    ),
    subtitle2: TextStyle(
      color: lightPrimaryContent,
    ),
    subtitle1: TextStyle(
      color: lightPrimaryContent,
    ),
    overline: TextStyle(
      color: lightPrimaryContent,
    ),
    button: TextStyle(
      color: lightPrimaryContent.withOpacity(0.8),
    ),
    bodyText2: TextStyle(
      color: lightPrimaryContent.withOpacity(0.8),
    ),
    bodyText1: TextStyle(
      color: lightPrimaryContent,
    ),
    caption: TextStyle(
      color: lightPrimaryContent,
    ),
  );
}
