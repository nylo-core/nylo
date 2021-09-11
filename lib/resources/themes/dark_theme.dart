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
  TextTheme darkTheme =
      getAppTextTheme(appThemeFont, defaultTextTheme.merge(_darkTextTheme()));
  return ThemeData(
    primaryColor: NyColors.light.primaryContent,
    backgroundColor: NyColors.dark.background,
    colorScheme: ColorScheme.dark(),
    primaryColorLight: NyColors.light.primaryAccent,
    primaryColorDark: NyColors.dark.primaryContent,
    focusColor: NyColors.dark.primaryContent,
    scaffoldBackgroundColor: NyColors.dark.background,
    hintColor: NyColors.light.primaryAccent,
    appBarTheme: AppBarTheme(
        backgroundColor: NyColors.dark.appBarBackground,
        titleTextStyle: darkTheme.headline6!
            .copyWith(color: NyColors.dark.appBarPrimaryContent),
        iconTheme: IconThemeData(color: NyColors.light.appBarPrimaryContent),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    buttonTheme: ButtonThemeData(
      buttonColor: NyColors.dark.primaryAccent,
      colorScheme: ColorScheme.light(primary: NyColors.dark.buttonBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: NyColors.dark.primaryContent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          primary: NyColors.dark.buttonPrimaryContent,
          backgroundColor: NyColors.dark.buttonBackground),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: NyColors.dark.bottomTabBarBackground,
      unselectedIconTheme:
          IconThemeData(color: NyColors.dark.bottomTabBarIconUnselected),
      selectedIconTheme:
          IconThemeData(color: NyColors.dark.bottomTabBarIconSelected),
      unselectedLabelStyle:
          TextStyle(color: NyColors.dark.bottomTabBarLabelUnselected),
      selectedLabelStyle:
          TextStyle(color: NyColors.dark.bottomTabBarLabelSelected),
      selectedItemColor: NyColors.dark.bottomTabBarLabelSelected,
    ),
    textTheme: darkTheme,
  );
}

/*
|--------------------------------------------------------------------------
| Dark Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _darkTextTheme() {
  final Color darkPrimaryContent = NyColors.dark.primaryContent;
  return TextTheme(
    headline6: TextStyle(
      color: darkPrimaryContent.withOpacity(0.8),
    ),
    headline5: TextStyle(
      color: darkPrimaryContent,
    ),
    headline4: TextStyle(
      color: darkPrimaryContent,
    ),
    headline3: TextStyle(
      color: darkPrimaryContent,
    ),
    headline2: TextStyle(
      color: darkPrimaryContent,
    ),
    headline1: TextStyle(
      color: darkPrimaryContent,
    ),
    subtitle2: TextStyle(
      color: darkPrimaryContent,
    ),
    subtitle1: TextStyle(
      color: darkPrimaryContent,
    ),
    overline: TextStyle(
      color: darkPrimaryContent,
    ),
    button: TextStyle(
      color: darkPrimaryContent.withOpacity(0.8),
    ),
    bodyText2: TextStyle(
      color: darkPrimaryContent.withOpacity(0.8),
    ),
    bodyText1: TextStyle(
      color: NyColors.light.primaryContent,
    ),
    caption: TextStyle(
      color: darkPrimaryContent.withOpacity(0.8),
    ),
  );
}
