import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/theme_helper.dart';

class ConfigApp {

  ConfigApp._privateConstructor();

  static final ConfigApp instance = ConfigApp._privateConstructor();

  /*
|--------------------------------------------------------------------------
| APP NAME
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/

  String name = "Nylo";

/*
|--------------------------------------------------------------------------
| DEBUG
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/
  bool configDebug = true;

/*
|--------------------------------------------------------------------------
| URL
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/
  String url = "https://localhost:8080";

/*
|--------------------------------------------------------------------------
| ASSETS PATH
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/
  String configAssetPath = "public/assets/";

/*
|--------------------------------------------------------------------------
| TIME ZONE
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/
  String timezone = "UTC";

/*
|--------------------------------------------------------------------------
| DEFAULT LOCALE
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/

  Locale defaultLocale = Locale("en", null);

  /*
|--------------------------------------------------------------------------
| SUPPORTED LOCALES
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/
  Iterable<Locale> supportedLocales = [
    Locale('en'),
  ];

/*
|--------------------------------------------------------------------------
| DEVICE ORIENTATIONS
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/

  List<DeviceOrientation> deviceOrientations = [
    DeviceOrientation.portraitUp,
  ];

  ThemeData themeData = CurrentTheme.instance.theme;

  AppBuildSettings toAppSettings() {
    return AppBuildSettings(
      title: this.name,
      locale: this.defaultLocale,
      supportedLocales: this.supportedLocales,
      defaultBrightness: CurrentTheme.instance.theme.brightness,
      themeData: themeData,
    );
  }
}
