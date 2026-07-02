import 'package:flutter/material.dart';
import '/resources/widgets/buttons/abstract/app_button.dart';

class TextOnlyButton extends StatefulAppButton {
  final Color? contentColor;
  final bool underline;

  TextOnlyButton({
    super.key,
    required super.text,
    super.onPressed,
    super.submitForm,
    super.onFailure,
    super.showToastError = true,
    super.loadingStyle,
    super.animationStyle,
    super.splashStyle,
    this.contentColor,
    this.underline = false,
    super.width,
    super.height,
  });

  @override
  Widget buildButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color fgColor = contentColor ?? theme.colorScheme.primary;

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: fgColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          decoration: underline ? TextDecoration.underline : null,
          decorationColor: fgColor,
        ),
      ),
    );
  }
}
