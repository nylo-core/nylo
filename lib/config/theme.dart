import 'package:flutter_app/bootstrap/base_theme_config.dart';
import 'package:flutter_app/resources/themes/dark_theme.dart';
import 'package:flutter_app/resources/themes/light_theme.dart';
import 'package:flutter_app/resources/themes/styles/base_styles.dart';
import 'package:flutter_app/resources/themes/styles/dark_theme_colors.dart';
import 'package:flutter_app/resources/themes/styles/light_theme_colors.dart';

/*
|--------------------------------------------------------------------------
| Themes
| Manage your Flutter application's themes.
|
| Learn more: https://nylo.dev/docs/3.x/themes
|--------------------------------------------------------------------------
*/

// App Themes
final appThemes = [
  ThemeConfig.light(),
  ThemeConfig.dark(),
];

/*
|--------------------------------------------------------------------------
| Colors
|--------------------------------------------------------------------------
*/

// Light Colors
BaseColorStyles lightColors = LightThemeColors();

// Dark Colors
BaseColorStyles darkColors = DarkThemeColors();

/*
|--------------------------------------------------------------------------
| Themes
|--------------------------------------------------------------------------
*/

// Preset Themes
class ThemeConfig {
  // LIGHT
  static BaseThemeConfig light() => BaseThemeConfig(
        id: "default_light_theme",
        description: "Light theme",
        theme: lightTheme(lightColors),
        colors: lightColors,
      );

  // DARK
  static BaseThemeConfig dark() => BaseThemeConfig(
        id: "default_dark_theme",
        description: "Dark theme",
        theme: darkTheme(darkColors),
        colors: darkColors,
      );

  // E.G. CUSTOM THEME
  /// Run: "flutter pub run nylo_framework:main make:theme bright_theme" // example bright_theme
  // Creates a basic theme in /resources/themes/bright_theme.dart
  // Creates the themes colors in /resources/themes/styles/bright_theme_colors.dart

  // First add the colors which was created into the above section like the following:
  // Bright Colors
  /// BaseColorStyles brightColors = BrightThemeColors();

  // Next, uncomment the below:
  /// static BaseThemeConfig bright() => BaseThemeConfig(
  ///  id: "default_bright_theme",
  ///  description: "Bright theme",
  ///  theme: brightTheme(brightColors),
  ///  colors: brightColors,
  /// );

  // To then use this theme, add it to the [appThemes] above like the following:
  // final appThemes = [
  ///   ThemeConfig.bright(), // new theme
  //
  //   ThemeConfig.light(),
  //
  //   ThemeConfig.dark(),
  // ];
}
