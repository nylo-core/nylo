import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Storage Keys
| Add your storage keys here and then use them later to retrieve data.
| E.g. static String userCoins = "USER_COINS";
| String coins = NyStorage.read( StorageKey.userCoins );
|
| Learn more: https://nylo.dev/docs/5.x/storage#storage-keys
|--------------------------------------------------------------------------
*/

class StorageKey {
  static String userToken = "USER_TOKEN";
  static String authUser = getEnv('AUTH_USER_KEY', defaultValue: 'AUTH_USER');

  /// Add your storage keys here...
}
