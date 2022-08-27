import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/font.dart';
import '../../resources/themes/styles/color_styles.dart';
import '../../resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme
|
| Theme Config - config/theme.dart
|--------------------------------------------------------------------------
*/

ThemeData darkTheme(ColorStyles darkColors) {
  TextTheme darkTheme = getAppTextTheme(
      appFont, defaultTextTheme.merge(_darkTextTheme(darkColors)));
  return ThemeData(
    primaryColor: darkColors.primaryContent,
    backgroundColor: darkColors.background,
    colorScheme: ColorScheme.dark(),
    primaryColorDark: darkColors.primaryContent,
    focusColor: darkColors.primaryContent,
    scaffoldBackgroundColor: darkColors.background,
    appBarTheme: AppBarTheme(
        backgroundColor: darkColors.appBarBackground,
        titleTextStyle: darkTheme.headline6!
            .copyWith(color: darkColors.appBarPrimaryContent),
        iconTheme: IconThemeData(color: darkColors.appBarPrimaryContent),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    buttonTheme: ButtonThemeData(
      buttonColor: darkColors.primaryAccent,
      colorScheme: ColorScheme.light(primary: darkColors.buttonBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: darkColors.primaryContent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          primary: darkColors.buttonPrimaryContent,
          backgroundColor: darkColors.buttonBackground),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColors.bottomTabBarBackground,
      unselectedIconTheme:
          IconThemeData(color: darkColors.bottomTabBarIconUnselected),
      selectedIconTheme:
          IconThemeData(color: darkColors.bottomTabBarIconSelected),
      unselectedLabelStyle:
          TextStyle(color: darkColors.bottomTabBarLabelUnselected),
      selectedLabelStyle:
          TextStyle(color: darkColors.bottomTabBarLabelSelected),
      selectedItemColor: darkColors.bottomTabBarLabelSelected,
    ),
    textTheme: darkTheme,
  );
}

/*
|--------------------------------------------------------------------------
| Dark Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _darkTextTheme(ColorStyles dark) {
  final Color darkPrimaryContent = dark.primaryContent;
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
      color: darkPrimaryContent,
    ),
    caption: TextStyle(
      color: darkPrimaryContent.withOpacity(0.8),
    ),
  );
}
