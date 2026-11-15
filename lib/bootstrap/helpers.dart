import 'package:material_ui/material_ui.dart';
import '/resources/themes/color_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Helpers
|--------------------------------------------------------------------------
| Add your helper methods here
|-------------------------------------------------------------------------- */

/// helper to find correct color from the [context].
class ThemeColorResolver {
  static ColorStyles get(BuildContext context, {String? themeId}) =>
      nyColorStyle<ColorStyles>(context, themeId: themeId);

  static Color fromHex(String hexColor) => nyHexColor(hexColor);
}
