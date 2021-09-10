import 'package:flutter/material.dart';
import 'package:flutter_app/config/styles/dark_theme_colors.dart';
import 'package:flutter_app/config/styles/light_theme_colors.dart';
import 'package:google_fonts/google_fonts.dart';

/*
|--------------------------------------------------------------------------
| Theme Font
|
| Uses Google Fonts - https://pub.dev/packages/google_fonts
|
| e.g. updating the font from "montserrat" to "lato"
| before: final TextStyle appThemeFont = GoogleFonts.montserrat();
| after:  final TextStyle appThemeFont = GoogleFonts.lato();
|--------------------------------------------------------------------------
*/

final TextStyle appThemeFont = GoogleFonts.montserrat();

// e.g. custom font in pubspec.yaml - https://flutter.dev/docs/cookbook/design/fonts
// final TextStyle appThemeFont = TextStyle(fontFamily: "ZenTokyoZoo");

/*
|--------------------------------------------------------------------------
| Theme Colors
|
| Customize your theme's light and dark themes: /lib/config/styles/
|--------------------------------------------------------------------------
*/

class NyColors {
  // Light Colors
  static LightThemeColors light = LightThemeColors();

  // Dark Colors
  static DarkThemeColors dark = DarkThemeColors();
}
