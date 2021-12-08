import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| localeType
| -------------------------------------------------------------------------
| Define if you want the application to read the locale from the users
| device settings or as you've defined in the [languageCode].
|--------------------------------------------------------------------------
*/
final LocaleType? localeType = LocaleType.asDefined; // device, asDefined

/*
|--------------------------------------------------------------------------
| languageCode
| -------------------------------------------------------------------------
| Define the language code you want to use. E.g. en, es, ar.
| The language code should match the name of the file i.e /lang/es.json
|--------------------------------------------------------------------------
*/
final String? languageCode = getEnv('DEFAULT_LOCALE', defaultValue: "en");

/*
|--------------------------------------------------------------------------
| languagesList
| -------------------------------------------------------------------------
| Add a list of supported languages.
|--------------------------------------------------------------------------
*/
final List<String> languagesList = const ['en'];

/*
|--------------------------------------------------------------------------
| assetsDirectory
| -------------------------------------------------------------------------
| Asset directory for your languages.
|--------------------------------------------------------------------------
*/
final String? assetsDirectory = 'lang/';

/*
|--------------------------------------------------------------------------
| valuesAsMap
| -------------------------------------------------------------------------
| If you want to define your own language map in code rather than using
| the asset json files.
|--------------------------------------------------------------------------
*/
final Map<String, String>? valuesAsMap = {};