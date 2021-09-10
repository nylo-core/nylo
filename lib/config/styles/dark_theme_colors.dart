import 'package:flutter/material.dart';
import 'package:nylo_framework/theme/helper/theme_helper.dart';

/*
|--------------------------------------------------------------------------
| Dark Theme Colors
|--------------------------------------------------------------------------
*/

class DarkThemeColors implements NyBaseColors {
  // general
  Color get background => const Color(0xFF232c33);
  Color get primaryContent => const Color(0xFFE1E1E1);
  Color get primaryAccent => const Color(0xFF9999aa);

  // app bar
  Color get appBarBackground => const Color(0xFF4b5e6d);
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonBackground => Colors.white60;
  Color get buttonPrimaryContent => const Color(0xFF232c33);
}