import 'package:nylo_framework/nylo_framework.dart';

/* Toast Notification Styles
|--------------------------------------------------------------------------
| Define your toast notification styles here.
|-------------------------------------------------------------------------- */

class NyToastNotificationStyleMetaHelper extends ToastNotificationStyleMetaHelper {

  NyToastNotificationStyleMetaHelper(super.style);

  @override
  onSuccess() {
    return ToastMeta.success();
  }

  @override
  onWarning() {
    return ToastMeta.warning();
  }

  @override
  onInfo() {
    return ToastMeta.info();
  }

  @override
  onDanger() {
    return ToastMeta.danger();
  }

  // Example customizing the default notification
  // for 'ToastNotificationStyleType.SUCCESS'
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