import 'package:nylo_framework/nylo_framework.dart';

/* Storage Keys
|--------------------------------------------------------------------------
| Application configuration settings.
| Learn more: https://nylo.dev/docs/7.x/configuration
| -------------------------------------------------------------------------
| You can access these config values throughout your app using:
| `StorageKeysConfig.auth`, `StorageKeysConfig.bearerToken`, etc.
|-------------------------------------------------------------------------- */

final class StorageKeysConfig {
  // Define the keys you want to be synced on boot
  static Future<List<StorageKey>> Function() syncedOnBoot() => () async {
        return <StorageKey>[
          auth,
          bearerToken,
          // coins.defaultValue(10), // give the user 10 coins by default
        ];
      };

  static final StorageKey auth = 'SK_USER';

  static final StorageKey bearerToken = 'SK_BEARER_TOKEN';

  // static final StorageKey coins = 'SK_COINS';

  /// Add your storage keys here...
}
