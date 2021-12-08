import 'package:flutter/material.dart';

/// Interface for your base styles.
/// Add more styles here and then implement in
/// light_theme_colors.dart and dark_theme_colors.dart.
///
abstract class BaseColorStyles {
  /// * Available styles *

  // general
  Color get background;
  Color get primaryContent;
  Color get primaryAccent;

  Color get surfaceBackground;
  Color get surfaceContent;

  // app bar
  Color get appBarBackground;
  Color get appBarPrimaryContent;

  // buttons
  Color get buttonBackground;
  Color get buttonPrimaryContent;

  // bottom tab bar
  Color get bottomTabBarBackground;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected;
  Color get bottomTabBarIconUnselected;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected;
  Color get bottomTabBarLabelSelected;

  // e.g. add a new style
  // Uncomment the below:
  // Color get iconBackground;

  // Then implement in color in:
  // /resources/themes/styles/light_theme_colors
  // /resources/themes/styles/dark_theme_colors
}
