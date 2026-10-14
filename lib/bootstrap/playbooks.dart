import 'package:flutter/foundation.dart';
import 'package:nylo_framework/playbook.dart';

/* Playbooks
|--------------------------------------------------------------------------
| Playbooks are user journeys your app performs on itself: taps, typing,
| scrolling and page changes, at a natural, fast or slow pace.
| Metro adds them here, so there's no need to edit this file.
| Create one:
|   metro make:playbook sign_up_to_dashboard
| Then, while your app is running, play it:
|   metro live:run playbook sign_up_to_dashboard
| or open metro live and type: playbook sign_up_to_dashboard
|
| Release builds get an empty map, so playbooks are left out of the app
| you ship.
|
| Learn more: https://nylo.dev/docs/7.x/metro
|-------------------------------------------------------------------------- */

final Map<String, Playbook Function()> playbooks = kReleaseMode
    ? const {}
    : {

      };
