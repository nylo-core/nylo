import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/styles/color_styles.dart';
import '../config/decoders.dart';
import '../config/events.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/config/constants.dart';

// Add your helper methods here
// ...

/// helper to find correct color from the [context].
class ThemeColor {
  static ColorStyles get(BuildContext context, {String? themeId}) {

    Nylo nylo = Backpack.instance.read('nylo');
    List<BaseThemeConfig> appThemes = nylo.appThemes;

    if (themeId == null) {
      dynamic themeFound = appThemes.firstWhere(
          (theme) =>
              theme.id ==
              (Theme.of(context).brightness == Brightness.light
                  ? Constants.LIGHT_THEME_ID
                  : Constants.DARK_THEME_ID),
          orElse: () => appThemes.first);
      return themeFound.colors;
    }

    dynamic baseThemeConfig = appThemes.firstWhere((theme) => theme.id == themeId, orElse: () => appThemes.first);
    return baseThemeConfig.colors;
  }
}

/// helper to set colors on TextStyle
extension ColorsHelper on TextStyle {
  TextStyle? setColor(
      BuildContext context, Color Function(BaseColorStyles color) newColor, {String? themeId}) {
    return copyWith(color: newColor(ThemeColor.get(context, themeId: themeId)));
  }
}

/// API helper
api<T>(dynamic Function(T request) request, {
  BuildContext? context,
  Map<String, dynamic> headers = const {},
  String? bearerToken}) async => await nyApi<T>(
    request: request,
    apiDecoders: apiDecoders,
    context: context,
    headers: headers, bearerToken: bearerToken,
);

/// Event helper
event<T>({Map? data}) async => nyEvent<T>(params: data, events: events);