import 'package:flutter/foundation.dart';
import 'package:nylo_framework/live.dart';

/* Seeders
|--------------------------------------------------------------------------
| Seeders put your running app into a known state, like a signed-in user
| with sample data, and take it back out again.
| Metro adds them here, so there's no need to edit this file. Create one:
|   metro make:seeder demo_user
| Then, while your app is running, open metro live and seed it:
|   seed demo_user
|
| Learn more: https://nylo.dev/docs/7.x/metro
|-------------------------------------------------------------------------- */

final Map<String, Seeder Function()> seeders = kReleaseMode ? const {} : {};
