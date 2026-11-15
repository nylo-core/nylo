import 'package:material_ui/material_ui.dart';

/* Default text theme
|-------------------------------------------------------------------------- */

const TextTheme defaultTextTheme = TextTheme(
  // Display - Large, prominent text for hero sections
  displayLarge: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displayMedium: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  ),
  displaySmall: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
  ),

  // Headline - Section headers
  headlineLarge: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
  ),

  // Title - Card titles, list headers
  titleLarge: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),

  // Body - Main content text
  bodyLarge: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontSize: 15.5,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
  ),

  // Label - Buttons, chips, captions
  labelLarge: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  labelMedium: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  ),
  labelSmall: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
);
