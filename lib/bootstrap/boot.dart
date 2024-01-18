import '/config/providers.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Boot
|--------------------------------------------------------------------------
| The nylo method is called before the app is initialized.
| The finished method is called after the app is initialized.
|-------------------------------------------------------------------------- */

class Boot {
  static Future<Nylo> nylo() async => await bootApplication(providers);
  static Future<void> finished(Nylo nylo) async =>
      await bootFinished(nylo, providers);
}