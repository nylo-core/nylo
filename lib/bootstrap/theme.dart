import '/resources/themes/dark/dark_theme.dart';
import '/resources/themes/light/light_theme.dart';
import '/resources/themes/color_styles.dart';
import '/resources/themes/dark/dark_theme_colors.dart';
import '/resources/themes/light/light_theme_colors.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Flutter Themes
|--------------------------------------------------------------------------
| Run the below in the terminal to add a new theme.
| "dart run nylo_framework:main make:theme bright_theme"
|
| Learn more: https://nylo.dev/docs/7.x/themes-and-styling
|-------------------------------------------------------------------------- */

// App Themes
final List<BaseThemeConfig<ColorStyles>> appThemes = <BaseThemeConfig<ColorStyles>>[
  BaseThemeConfig<ColorStyles>(
    id: 'light_theme',
    theme: lightTheme,
    colors: LightThemeColors(),
    type: NyThemeType.light,
  ),
  BaseThemeConfig<ColorStyles>(
    id: 'dark_theme',
    theme: darkTheme,
    colors: DarkThemeColors(),
    type: NyThemeType.dark,
  ),
];
