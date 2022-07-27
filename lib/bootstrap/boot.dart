import '../config/providers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Boot {
  static Future<Nylo> nylo() async => await bootApplication(providers);
  static Future<void> finished(Nylo nylo) async => await bootFinished(nylo);
}