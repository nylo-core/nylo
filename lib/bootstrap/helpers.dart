import 'package:flutter/material.dart';
import '../config/decoders.dart';
import '../config/events.dart';
import '../config/theme.dart';
import '../resources/themes/styles/base_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

// Add your helper methods here
// ...

/// helper to find correct color from the [context].
class ThemeColor {
  static BaseColorStyles get(BuildContext context) {
    return ((Theme.of(context).brightness == Brightness.light)
        ? ThemeConfig.light().colors
        : ThemeConfig.dark().colors);
  }
}

/// helper to set colors on TextStyle
extension ColorsHelper on TextStyle {
  TextStyle? setColor(
      BuildContext context, Color Function(BaseColorStyles color) newColor) {
    return copyWith(color: newColor(ThemeColor.get(context)));
  }
}

/// API helper
api<T>(dynamic Function(T) request, {BuildContext? context}) async => await nyApi<T>(request: request, apiDecoders: apiDecoders, context: context);

/// Event helper
event<T>({Map? data}) async => nyEvent<T>(params: data, events: events);