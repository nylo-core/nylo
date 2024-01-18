import 'package:nylo_framework/nylo_framework.dart';

/* Toast Notification Styles
|--------------------------------------------------------------------------
| Define your toast notification styles here.
| Learn more: https://nylo.dev/docs/5.20.0/toast-notifications
|-------------------------------------------------------------------------- */

class NyToastNotificationStyleMetaHelper extends ToastNotificationStyleMetaHelper {

  NyToastNotificationStyleMetaHelper(ToastNotificationStyleType? style) : super(style);

  onSuccess() {
    return ToastMeta.success();
  }

  onWarning() {
    return ToastMeta.warning();
  }

  onInfo() {
    return ToastMeta.info();
  }

  onDanger() {
    return ToastMeta.danger();
  }

  // Example customizing a notification
  // onSuccess() {
  //   return ToastMeta.success(
  //     title: "Hello",
  //     description: "World",
  //     action: () {},
  //     backgroundColor: Colors.Yellow,
  //     metaData: {
  //       "add_extra": "meta_data"
  //     }
  //   );
  // }
}