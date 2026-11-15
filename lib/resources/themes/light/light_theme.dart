import 'package:material_ui/material_ui.dart';
import '/resources/themes/base_theme.dart';
import '/resources/themes/color_styles.dart';

/* Light Theme
|--------------------------------------------------------------------------
| Theme Config - config/theme.dart
|-------------------------------------------------------------------------- */

ThemeData lightTheme(ColorStyles color) =>
    buildAppTheme(color, brightness: Brightness.light);
