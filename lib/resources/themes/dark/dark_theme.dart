import 'package:material_ui/material_ui.dart';
import '/resources/themes/base_theme.dart';
import '/resources/themes/color_styles.dart';

/* Dark Theme
|--------------------------------------------------------------------------
| Theme Config - config/theme.dart
|-------------------------------------------------------------------------- */

ThemeData darkTheme(ColorStyles color) =>
    buildAppTheme(color, brightness: Brightness.dark);
