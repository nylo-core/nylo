import 'package:material_ui/material_ui.dart';
import '/resources/themes/color_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Light Theme Colors
|-------------------------------------------------------------------------- */

class LightThemeColors extends ColorStyles {
  /// Colors for general use.
  @override
  GeneralColors get general => const GeneralColors(
        background: Color(0xFFFFFFFF),
        content: Color(0xFF000000),
        primaryAccent: Color(0xFF0045a0),
        surface: Colors.white,
        surfaceContent: Colors.black,
      );

  /// Colors for the app bar.
  @override
  AppBarColors get appBar => const AppBarColors(
        background: Colors.white,
        content: Colors.black,
      );

  /// Colors for the bottom tab bar.
  @override
  BottomTabBarColors get bottomTabBar => const BottomTabBarColors(
        background: Colors.white,
        iconSelected: Colors.blue,
        iconUnselected: Colors.black54,
        labelSelected: Colors.black,
        labelUnselected: Colors.black45,
      );
}
