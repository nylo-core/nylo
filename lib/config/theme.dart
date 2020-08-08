import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/theme/helper/theme_helper.dart';

class ConfigTheme {
  ConfigTheme._privateConstructor();

  static final ConfigTheme instance = ConfigTheme._privateConstructor();

  Brightness defaultBrightness = Brightness.light;

  ThemeData themeData = CurrentTheme.instance.theme;
}