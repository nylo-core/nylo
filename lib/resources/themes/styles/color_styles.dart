import 'package:nylo_framework/nylo_framework.dart';

/// Interface for your base styles.
/// Add more styles here and then implement in
/// light_theme_colors.dart and dark_theme_colors.dart.

abstract class ColorStyles extends BaseColorStyles {
  /// * Available styles *

  // general
  @override
  Color get background;
  @override
  Color get primaryContent;
  @override
  Color get primaryAccent;

  @override
  Color get surfaceBackground;
  @override
  Color get surfaceContent;

  // app bar
  @override
  Color get appBarBackground;
  @override
  Color get appBarPrimaryContent;

  // buttons
  @override
  Color get buttonBackground;
  @override
  Color get buttonPrimaryContent;

  // bottom tab bar
  @override
  Color get bottomTabBarBackground;

  // bottom tab bar - icons
  @override
  Color get bottomTabBarIconSelected;
  @override
  Color get bottomTabBarIconUnselected;

  // bottom tab bar - label
  @override
  Color get bottomTabBarLabelUnselected;
  @override
  Color get bottomTabBarLabelSelected;

  // e.g. add a new style
  // Uncomment the below:
  // Color get iconBackground;

  // Then implement in color in:
  // /resources/themes/styles/light_theme_colors
  // /resources/themes/styles/dark_theme_colors
}
