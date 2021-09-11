import 'package:flutter/material.dart';

/// Interface for your base styles.
/// Add more styles here and then implement in
/// light_theme_colors.dart and dark_theme_colors.dart.
abstract class BaseStyles {
  // general
  Color get background;
  Color get primaryContent;
  Color get primaryAccent;

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
}
