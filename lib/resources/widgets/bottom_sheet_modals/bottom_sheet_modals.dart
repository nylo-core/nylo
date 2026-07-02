import 'package:flutter/material.dart';
import 'modals/logout_modal.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../buttons/buttons.dart';

/// BottomSheetModal
///
/// A class for displaying modal bottom sheets.
/// Add your custom modals as static methods below.
///
/// Example usage:
/// ```dart
/// BottomSheetModal.showLogout(context);
/// ```
class BottomSheetModal extends NyBaseModal {

  /// Reference to the base modal show method
  static ModalShowFunction get displayModal => NyBaseModal.show;

  /// Show a logout confirmation modal
  static Future<void> showLogout(
    BuildContext context, {
    Function()? onLogoutPressed,
    Function()? onCancelPressed,
  }) {
    return displayModal(
      context,
      isScrollControlled: false,
      child: const LogoutModal(),
      actionsRow: <Widget>[
        Button.secondary(
          text: "Logout",
          onPressed: () async {
            if (onLogoutPressed != null) {
              onLogoutPressed();
            } else {
              routeToInitial();
            }
          },
        ),
        const SizedBox(width: 8),
        Button.textOnly(
          text: "Cancel",
          onPressed: () {
            if (onCancelPressed != null) {
              onCancelPressed();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }

}
