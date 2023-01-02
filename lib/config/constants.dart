import 'package:nylo_framework/nylo_framework.dart';

/// ## Constants
///
/// Constant values
class Constants {
  static String APP_NAME = "ORG";
  static String APP_URL = "https://demo.com";
  static String DEFAULT_LOCALE = "en";
  static String TIMEZONE = "UTC";
  static String LIGHT_THEME_ID = "light_theme";
  static String DARK_THEME_ID = "dark_theme";
  static String ASSET_PATH_PUBLIC = getEnv("ASSET_PATH_PUBLIC", defaultValue: "public/assets");
  static String ASSET_PATH_IMAGES = getEnv("ASSET_PATH_IMAGES", defaultValue: "public/assets/images");

  /// Returns type of app environment
  ///
  /// One of: "dev" or "prod"
  static String get APP_ENV {
    switch (getEnv("APP_ENV")) {
      case "prod":
        return "prod";
      default:
        return "dev";
    }
  }

  /// Is debug mode enabled?
  static bool get APP_DEBUG {
    switch (getEnv("APP_DEBUG")) {
      case false:
        return false;
      default:
        return true;
    }
  }

  /// Returns API Endpoint of Demo Servers
  static String get API_BASE_URL {
    switch (getEnv("APP_ENV")) {
      case "prod":
        return "https://api.demo.com";
      default:
        return "http://localhost:8080";
    }
  }
}
