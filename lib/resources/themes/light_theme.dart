import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/app_font.dart';
import 'package:flutter_app/resources/themes/styles/base_styles.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Light Theme
|
| Theme Config - config/app_theme.dart
|--------------------------------------------------------------------------
*/

ThemeData lightTheme(BaseColorStyles lightColors) {
  TextTheme lightTheme =
  getAppTextTheme(appFont, defaultTextTheme.merge(_lightTextTheme(lightColors)));

  return ThemeData(
    primaryColor: lightColors.primaryContent,
    backgroundColor: lightColors.background,
    colorScheme: ColorScheme.light(),
    primaryColorLight: lightColors.primaryAccent,
    focusColor: lightColors.primaryContent,
    scaffoldBackgroundColor: lightColors.background,
    hintColor: lightColors.primaryAccent,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColors.appBarBackground,
      titleTextStyle: lightTheme.headline6!
          .copyWith(color: lightColors.appBarPrimaryContent),
      iconTheme: IconThemeData(color: lightColors.appBarPrimaryContent),
      elevation: 1.0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lightColors.buttonPrimaryContent,
      colorScheme: ColorScheme.light(primary: lightColors.buttonBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: lightColors.primaryContent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          primary: lightColors.buttonPrimaryContent,
          backgroundColor: lightColors.buttonBackground),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColors.bottomTabBarBackground,
      unselectedIconTheme:
          IconThemeData(color: lightColors.bottomTabBarIconUnselected),
      selectedIconTheme:
          IconThemeData(color: lightColors.bottomTabBarIconSelected),
      unselectedLabelStyle:
          TextStyle(color: lightColors.bottomTabBarLabelUnselected),
      selectedLabelStyle:
          TextStyle(color: lightColors.bottomTabBarLabelSelected),
      selectedItemColor: lightColors.bottomTabBarLabelSelected,
    ),
    textTheme: lightTheme,
  );
}

/*
|--------------------------------------------------------------------------
| Light Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _lightTextTheme(BaseColorStyles lightColors) {
  Color lightPrimaryContent = lightColors.primaryContent;
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
