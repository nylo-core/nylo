import 'package:flutter/material.dart';
import '/resources/widgets/local_asset_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Used in BottomSheetModal
class LogoutModal extends StatelessWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(40),
          ),
          child: LocalAsset.image("logo.png", height: 35, width: 35),
        ),
        const SizedBox(height: 8),
        TextTr(
          "Are you sure you want to logout of your account?",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}