import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/resources/widgets/loader_widget.dart';
import '/resources/widgets/logo_widget.dart';
import 'package:google_fonts/google_fonts.dart';

/* Design
|--------------------------------------------------------------------------
| Application configuration settings.
| Learn more: https://nylo.dev/docs/7.x/configuration
| -------------------------------------------------------------------------
| You can access these config values throughout your app using:
| `DesignConfig.appFont`, `DesignConfig.logo`, etc.
|-------------------------------------------------------------------------- */

final class DesignConfig {
  // App Font - Google Fonts
  static final TextStyle appFont = GoogleFonts.outfit();

  // App Logo - Use the `Logo()` widget to display your logo
  static final Widget logo = const Logo();

  // App Loader - Use the `Loader()` widget to display a loader
  static final Widget loader = const Loader();

  // Form Field Style - How every form field is drawn:
  // FormFieldStyle.filled(), .outlined(), .underlined() or .grouped()
  static const FormFieldStyle formFieldStyle = FormFieldStyle.filled();
}
