import 'package:material_ui/material_ui.dart';
import '/resources/themes/color_styles.dart';
import '/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// [Text] Extensions
extension NyText on Text {
  Text setColor(
      BuildContext context, Color Function(ColorStyles color) newColor,
      {String? themeId}) {
    return copyWith(
        style: TextStyle(
            color:
                newColor(ThemeColorResolver.get(context, themeId: themeId))));
  }
}

/// [BuildContext] Extensions
extension NyApp on BuildContext {
  /// Get the current theme color
  ColorStyles get color => ThemeColorResolver.get(this);
}

/// [TextStyle] Extensions
extension NyTextStyle on TextStyle {
  TextStyle? setColor(
      BuildContext context, Color Function(ColorStyles color) newColor,
      {String? themeId}) {
    return copyWith(
        color: newColor(ThemeColorResolver.get(context, themeId: themeId)));
  }
}
