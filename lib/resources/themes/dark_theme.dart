import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/config/font.dart';
import '/resources/themes/styles/color_styles.dart';
import '/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme
|
| Theme Config - config/theme.dart
|--------------------------------------------------------------------------
*/

ThemeData darkTheme(ColorStyles color) {
  TextTheme darkTheme =
      getAppTextTheme(appFont, defaultTextTheme.merge(_textTheme(color)));
  return ThemeData(
    useMaterial3: true,
    primaryColor: color.primaryContent,
    primaryColorDark: color.primaryContent,
    focusColor: color.primaryContent,
    scaffoldBackgroundColor: color.background,
    appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: color.appBarBackground,
        titleTextStyle:
            darkTheme.titleLarge!.copyWith(color: color.appBarPrimaryContent),
        iconTheme: IconThemeData(color: color.appBarPrimaryContent),
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    buttonTheme: ButtonThemeData(
      buttonColor: color.primaryAccent,
      colorScheme: ColorScheme.light(primary: color.buttonBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: color.primaryContent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: color.buttonPrimaryContent,
          backgroundColor: color.buttonBackground),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: color.bottomTabBarBackground,
      unselectedIconTheme:
          IconThemeData(color: color.bottomTabBarIconUnselected),
      selectedIconTheme: IconThemeData(color: color.bottomTabBarIconSelected),
      unselectedLabelStyle: TextStyle(color: color.bottomTabBarLabelUnselected),
      selectedLabelStyle: TextStyle(color: color.bottomTabBarLabelSelected),
      selectedItemColor: color.bottomTabBarLabelSelected,
    ),
    textTheme: darkTheme,
    colorScheme: ColorScheme.dark(background: color.background),
  );
}

/*
|--------------------------------------------------------------------------
| Dark Text Theme
|--------------------------------------------------------------------------
*/

TextTheme _textTheme(ColorStyles colors) {
  Color primaryContent = colors.primaryContent;
  TextTheme textTheme = TextTheme().apply(displayColor: primaryContent);
  return textTheme.copyWith(
      titleLarge: TextStyle(color: primaryContent.withOpacity(0.8)),
      labelLarge: TextStyle(color: primaryContent.withOpacity(0.8)),
      bodySmall: TextStyle(color: primaryContent.withOpacity(0.8)),
      bodyMedium: TextStyle(color: primaryContent.withOpacity(0.8)));
}
