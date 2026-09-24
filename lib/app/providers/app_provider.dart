import '/config/storage_keys.dart';
import '/config/toast_notification.dart';
import '/bootstrap/decoders.dart';
import '/config/design.dart';
import '/bootstrap/theme.dart';
import '/config/localization.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/bootstrap/seeders.dart';

class AppProvider implements NyProvider {
  @override
  setup(Nylo nylo) async {
    await nylo.configure(
      localization: NyLocalizationConfig(
        languageCode: LocalizationConfig.languageCode,
        localeType: LocalizationConfig.localeType,
        assetsDirectory: LocalizationConfig.assetsDirectory,
      ),
      loader: DesignConfig.loader,
      logo: DesignConfig.logo,
      themes: appThemes,
      initialThemeId: 'light_theme',
      toastNotifications: ToastNotificationConfig.styles,
      modelDecoders: modelDecoders,
      controllers: controllers,
      apiDecoders: apiDecoders,
      authKey: StorageKeysConfig.auth,
      syncKeys: StorageKeysConfig.syncedOnBoot,
      monitorAppUsage: false,
      showDateTimeInLogs: false,
      broadcastEvents: false,
      useErrorStack: true,
      seeders: seeders,
    );

    return nylo;
  }

  @override
  boot(Nylo nylo) async {
    // NyLogger.onLog = (NyLogEntry entry) {
    //   // Listen to log entries
    // };
  }
}
