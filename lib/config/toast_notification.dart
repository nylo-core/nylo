import 'package:nylo_framework/nylo_framework.dart';

/// ToastNotificationStyleMetaHelper is used to return
/// the correct value for the [ToastNotificationStyleType] toast style.
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

  // Example custom notification
  // onCustom() {
  //   return ToastMeta.custom(
  //     title: "",
  //     description: "",
  //     action: () {},
  //     backgroundColor: Colors.green
  //   );
  // }
}