/* Toast Notification
|--------------------------------------------------------------------------
| Learn more: https://nylo.dev/docs/7.x/configuration
|-------------------------------------------------------------------------- */

import 'package:flutter/material.dart';
import '/resources/widgets/toast_notification_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Toast Notification
|--------------------------------------------------------------------------
| Application configuration settings.
| Learn more: https://nylo.dev/docs/7.x/configuration
| -------------------------------------------------------------------------
| You can access these config values throughout your app using:
| `ToastNotificationConfig.styles`
|-------------------------------------------------------------------------- */

final class ToastNotificationConfig {
  static final Map<String, dynamic> styles = <String, dynamic>{
    'success': ToastNotification.style(
      icon: const Icon(Icons.check, color: Colors.green, size: 20),
      color: Colors.green.shade50,
      defaultTitle: 'Success',
      animation: ToastAnimation.springFromTop(),
      reverseAnimation: ToastAnimation.fadeOut(),
    ),
    'warning': ToastNotification.style(
      icon: const Icon(Icons.error_outline, color: Colors.orange, size: 20),
      color: Colors.orange.shade50,
      defaultTitle: 'Oops!',
      animation: ToastAnimation.springFromTop(),
      reverseAnimation: ToastAnimation.fadeOut(),
    ),
    'info': ToastNotification.style(
      icon: const Icon(Icons.info, color: Colors.teal, size: 20),
      color: Colors.teal.shade50,
      defaultTitle: 'Info',
      animation: ToastAnimation.springFromTop(),
      reverseAnimation: ToastAnimation.fadeOut(),
    ),
    'danger': ToastNotification.style(
      icon: const Icon(Icons.warning, color: Colors.redAccent, size: 20),
      color: Colors.red.shade50,
      defaultTitle: 'Oops!',
      animation: ToastAnimation.springFromTop(),
      duration: Duration(seconds: 2),
      reverseAnimation: ToastAnimation.fadeOut(),
    ),
    'my_custom_toast': (dynamic data) => ToastNotification.builder(
      (BuildContext context) {
        return Container(
          height: 90,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(data['title'] ?? '')],
          ),
        );
      },
      animation: ToastAnimation.springFromTop(),
      reverseAnimation: ToastAnimation.fadeOut(),
      duration: const Duration(seconds: 2),
    ),
  };
}
