import 'package:material_ui/material_ui.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/resources/themes/color_styles.dart';

/* Dark Theme Colors
|-------------------------------------------------------------------------- */

class DarkThemeColors extends ColorStyles {
  /// Colors for general use.
  @override
  GeneralColors get general => const GeneralColors(
        background: Color(0xFF121212),
        content: Color(0xFFFFFFFF),
        primaryAccent: Color(0xFF4D9FFF),
        surface: Color(0xFF1E1E1E),
        surfaceContent: Colors.white,
      );

  /// Colors for the app bar.
  @override
  AppBarColors get appBar => const AppBarColors(
        background: Color(0xFF1E1E1E),
        content: Colors.white,
      );

  /// Colors for the bottom tab bar.
  @override
  BottomTabBarColors get bottomTabBar => const BottomTabBarColors(
        background: Color(0xFF1E1E1E),
        iconSelected: Color(0xFF4D9FFF),
        iconUnselected: Colors.white54,
        labelSelected: Colors.white,
        labelUnselected: Color(0x73FFFFFF),
      );
}
