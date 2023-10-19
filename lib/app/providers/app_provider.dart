import '/config/decoders.dart';
import '/config/design.dart';
import '/config/theme.dart';
import '/config/validation_rules.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/config/localization.dart';

class AppProvider implements NyProvider {
  @override
  boot(Nylo nylo) async {
    await NyLocalization.instance.init(
        localeType: localeType,
        languageCode: languageCode,
        languagesList: languagesList,
        assetsDirectory: assetsDirectory,
        valuesAsMap: valuesAsMap,
    );

    nylo.appLoader = loader;
    nylo.appLogo = logo;
    nylo.appThemes = appThemes;
    nylo.toastNotification = getToastNotificationWidget;
    nylo.addValidationRules(validationRules);
    nylo.addModelDecoders(modelDecoders);
    nylo.addControllers(controllers);

    return nylo;
  }

  @override
  afterBoot(Nylo nylo) async {

  }
}