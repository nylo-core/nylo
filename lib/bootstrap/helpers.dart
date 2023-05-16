import 'package:flutter/material.dart';
import 'package:flutter_app/resources/themes/styles/color_styles.dart';
import '../config/decoders.dart';
import '../config/events.dart';
import 'package:nylo_framework/nylo_framework.dart';

// Add your helper methods here
// ...

/// helper to find correct color from the [context].
class ThemeColor {
  static ColorStyles get(BuildContext context, {String? themeId}) =>
      nyColorStyle<ColorStyles>(context, themeId: themeId);

  static Color fromHex(String hexColor) => nyHexColor(hexColor);
}

/// API helper
api<T>(dynamic Function(T request) request,
        {BuildContext? context,
        Map<String, dynamic> headers = const {},
        String? bearerToken,
        String? baseUrl,
        List<Type> events = const []}) async =>
    await nyApi<T>(
        request: request,
        apiDecoders: apiDecoders,
        context: context,
        headers: headers,
        bearerToken: bearerToken,
        baseUrl: baseUrl,
        events: events);

/// Event helper
event<T>({Map? data}) async => await nyEvent<T>(params: data, events: events);