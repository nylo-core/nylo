import 'package:material_ui/material_ui.dart';
import '/config/app.dart';
import '/resources/widgets/splash_screen.dart';
import '../resources/widgets/main_widget.dart';
import '/bootstrap/providers.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Boot
|--------------------------------------------------------------------------
| The boot class is used to initialize your application.
| Providers are booted in the order they are defined.
|-------------------------------------------------------------------------- */

class Boot {
  /// Returns a [BootConfig] containing the setup and boot functions.
  static BootConfig nylo() => BootConfig(
        setup: () async {
          if (AppConfig.showSplashScreen) {
            runApp(SplashScreen.app());
          }

          await _init();
          return await setupApplication(providers);
        },
        boot: (Nylo nylo) async {
          await bootFinished(nylo, providers);

          runApp(Main(nylo));
        },
      );
}

/* Init
|--------------------------------------------------------------------------
| You can use _init to initialize classes, variables, etc.
| It's run before your app providers are booted.
|-------------------------------------------------------------------------- */

Future<void> _init() async {
  /// Example: Initializing StorageConfig
  // StorageConfig.init(
  //   androidOptions: AndroidOptions(
  //     resetOnError: true,
  //     encryptedSharedPreferences: false
  //   )
  // );
}
