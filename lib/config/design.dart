import 'package:flutter/material.dart';
import 'package:flutter_app/config/toast_notification.dart';
import 'package:flutter_app/resources/widgets/loader_widget.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import 'package:flutter_app/resources/widgets/toast_notification_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Design
| Contains widgets used in the Nylo framework.
|
| Learn more: https://nylo.dev/docs/5.x/themes-and-styling#design
|--------------------------------------------------------------------------
*/

Widget logo = Logo();
// resources/widgets/logo_widget.dart

Widget loader = Loader();
// resources/widgets/loader_widget.dart

Widget getToastNotificationWidget({
  required ToastNotificationStyleType style,
  Function(ToastNotificationStyleMetaHelper helper)? toastNotificationStyleMeta, Function? onDismiss}) {
  if (toastNotificationStyleMeta == null) return SizedBox.shrink();

  ToastMeta toastMeta = toastNotificationStyleMeta(NyToastNotificationStyleMetaHelper(style));

  return ToastNotification(toastMeta, onDismiss: onDismiss);
  // resources/widgets/toast_notification.dart
}