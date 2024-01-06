import 'package:flutter/material.dart';
import '/config/toast_notification.dart';
import '/resources/widgets/loader_widget.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/toast_notification_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Design
| Contains widgets used in the Nylo framework.
|
| Learn more: https://nylo.dev/docs/5.x/themes-and-styling#design
|--------------------------------------------------------------------------
*/

/* App Logo
|--------------------------------------------------------------------------
| This is the logo for your application.
| Use the Logo() widget or Nylo.getAppLogo() display your logo
| File: resources/widgets/logo_widget.dart
| --------------------------------------------------------------------------
*/

Widget logo = Logo();


/* Loader
|--------------------------------------------------------------------------
| This is the loading widget for your application.
| Use the Loader() widget or Nylo.getAppLoader() display your loader
| File: resources/widgets/loader_widget.dart
| --------------------------------------------------------------------------
*/

Widget loader = Loader();


/* Toast Notification
|--------------------------------------------------------------------------
| This is the toast notification widget for your application.
| Here you can handle the toast notification style.
| File: resources/widgets/toast_notification.dart
| --------------------------------------------------------------------------
*/

Widget getToastNotificationWidget({
  required ToastNotificationStyleType style,
  Function(ToastNotificationStyleMetaHelper helper)? toastNotificationStyleMeta, Function? onDismiss}) {
  if (toastNotificationStyleMeta == null) return SizedBox.shrink();

  ToastMeta toastMeta = toastNotificationStyleMeta(NyToastNotificationStyleMetaHelper(style));

  return ToastNotification(toastMeta, onDismiss: onDismiss);
}