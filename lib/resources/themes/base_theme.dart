import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/resources/themes/color_styles.dart';
import '/config/design.dart';
import 'default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Base Theme Builder
|--------------------------------------------------------------------------
| Shared theme configuration for light and dark themes.
| Theme Config - config/theme.dart
|-------------------------------------------------------------------------- */

ThemeData buildAppTheme(ColorStyles color, {required Brightness brightness}) {
  final bool isDark = brightness == Brightness.dark;

  TextTheme textTheme = getAppTextTheme(
      DesignConfig.appFont, defaultTextTheme.merge(_textTheme(color, isDark)));

  return ThemeData(
    useMaterial3: true,
    primaryColor: color.general.content,
    primaryColorLight: isDark ? null : color.general.primaryAccent,
    primaryColorDark: isDark ? color.general.content : null,
    focusColor: color.general.content,
    scaffoldBackgroundColor: color.general.background,
    hintColor: isDark ? null : color.general.primaryAccent,
    brightness: brightness,
    dividerTheme: DividerThemeData(
      color: isDark ? Colors.grey[800] : Colors.grey[100],
    ),
    datePickerTheme: isDark
        ? DatePickerThemeData(
            headerForegroundColor: Colors.white,
            weekdayStyle: const TextStyle(color: Colors.white),
            dayForegroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.black;
              }
              return Colors.white;
            }),
          )
        : null,
    timePickerTheme: isDark
        ? TimePickerThemeData(
            hourMinuteTextColor: Colors.white,
            dialTextColor: Colors.white,
            dayPeriodTextColor: Colors.white,
            helpTextStyle: const TextStyle(color: Colors.white),
            dayPeriodBorderSide: const BorderSide(color: Colors.white),
            dialBackgroundColor: Colors.grey[800],
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          )
        : null,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: color.appBar.background,
      titleTextStyle:
          textTheme.titleLarge!.copyWith(color: color.appBar.content),
      iconTheme: IconThemeData(color: color.appBar.content),
      elevation: 1.0,
      systemOverlayStyle:
          isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: color.general.content,
      colorScheme: ColorScheme.light(primary: color.general.background),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: color.general.content),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: color.general.content,
          backgroundColor: color.general.background),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: color.bottomTabBar.background,
      unselectedIconTheme:
          IconThemeData(color: color.bottomTabBar.iconUnselected),
      selectedIconTheme: IconThemeData(color: color.bottomTabBar.iconSelected),
      unselectedLabelStyle:
          TextStyle(color: color.bottomTabBar.labelUnselected),
      selectedLabelStyle: TextStyle(color: color.bottomTabBar.labelSelected),
      selectedItemColor: color.bottomTabBar.labelSelected,
    ),
    textTheme: textTheme,
    colorScheme: isDark
        ? ColorScheme.dark(
            primary: color.general.primaryAccent,
            onSurface: color.general.content,
          )
        : ColorScheme.light(
            surface: color.general.background,
            onSecondary: Colors.white,
            primary: color.general.primaryAccent,
          ),
  );
}

/* Text Theme
|-------------------------------------------------------------------------*/

TextTheme _textTheme(ColorStyles colors, bool isDark) {
  TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(color: colors.general.content),
    displayMedium: TextStyle(color: colors.general.content),
    displaySmall: TextStyle(color: colors.general.content),
    headlineLarge: TextStyle(color: colors.general.content),
    headlineMedium: TextStyle(color: colors.general.content),
    headlineSmall: TextStyle(color: colors.general.content),
    titleLarge: TextStyle(color: colors.general.content),
    titleMedium: TextStyle(color: colors.general.content),
    titleSmall: TextStyle(color: colors.general.content),
    bodyLarge: TextStyle(color: colors.general.content),
    bodyMedium: TextStyle(color: colors.general.content),
    bodySmall: TextStyle(color: colors.general.content),
    labelLarge: TextStyle(color: colors.general.content),
    labelMedium: TextStyle(color: colors.general.content),
    labelSmall: TextStyle(color: colors.general.content),
  );

  Color alphaColor = colors.general.content.withAlpha((255.0 * 0.8).round());

  if (isDark) {
    return textTheme.copyWith(
      titleLarge: TextStyle(color: alphaColor),
      labelLarge: TextStyle(color: alphaColor),
      bodySmall: TextStyle(color: alphaColor),
      bodyMedium: TextStyle(color: alphaColor),
    );
  }

  return textTheme.copyWith(
    labelLarge: TextStyle(color: alphaColor),
  );
}
