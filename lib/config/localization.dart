import 'package:nylo_framework/nylo_framework.dart';

/* Localization
|--------------------------------------------------------------------------
| Application configuration settings.
| Learn more: https://nylo.dev/docs/7.x/configuration
| -------------------------------------------------------------------------
| You can access these config values throughout your app using:
| `LocalizationConfig.languageCode`, `LocalizationConfig.localeType`, etc.
|-------------------------------------------------------------------------- */

final class LocalizationConfig {

  // The language code should match the name of the file i.e /lang/es.json
  static final String languageCode =
      getEnv('DEFAULT_LOCALE', defaultValue: "en");

  // LocaleType defines how locales are managed in the app.
  static final LocaleType localeType = LocaleType.asDefined;

  // Directory where language JSON files are stored
  static const String assetsDirectory = 'lang/';

  // Supported locales in the application
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('es'),
    // Add more locales as needed
  ];

  // Fallback language code if a translation is missing
  static const String fallbackLanguageCode = 'en';

  // List of language codes that use right-to-left text direction
  static const List<String> rtlLanguages = ['ar', 'he', 'fa', 'ur'];

  // Check if a language code uses right-to-left text direction
  static bool isRtl(String languageCode) => rtlLanguages.contains(languageCode);

  // Enable debug mode for missing translation keys
  static final bool debugMissingKeys =
      getEnv('DEBUG_TRANSLATIONS', defaultValue: 'false') == 'true';
}
