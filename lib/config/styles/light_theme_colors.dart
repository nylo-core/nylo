import 'package:flutter/material.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements NyBaseColors {
  // general
  Color get background => const Color(0xFFFFFFFF);
  Color get primaryContent => const Color(0xFF000000);
  Color get primaryAccent => const Color(0xFF87c694);

  // app bar
  Color get appBarBackground => Colors.blue;
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonBackground => Colors.blueAccent;
  Color get buttonPrimaryContent => Colors.white;
}
