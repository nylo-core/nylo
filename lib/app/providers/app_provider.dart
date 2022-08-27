import 'package:flutter_app/config/theme.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../config/localization.dart';

class AppProvider implements NyProvider {

  boot(Nylo nylo) async {
    await NyLocalization.instance.init(
        localeType: localeType,
        languageCode: languageCode,
        languagesList: languagesList,
        assetsDirectory: assetsDirectory,
        valuesAsMap: valuesAsMap);

    nylo.appThemes = appThemes;

    return nylo;
  }
}
