import 'package:flutter/material.dart';
import '/resources/widgets/buttons/abstract/app_button.dart';

class OutlinedButton extends StatefulAppButton {
  final Color? borderColor;
  final Color? textColor;
  final double borderWidth;

  OutlinedButton({
    super.key,
    required super.text,
    super.onPressed,
    super.submitForm,
    super.onFailure,
    super.showToastError = true,
    super.loadingStyle,
    super.animationStyle,
    super.splashStyle,
    this.borderColor,
    this.textColor,
    this.borderWidth = 1.5,
    super.width,
    super.height,
  });

  @override
  Widget buildButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final Color strokeColor = borderColor ?? theme.colorScheme.outline;
    final Color fgColor = textColor ?? theme.colorScheme.primary;
    final BorderRadius radius = BorderRadius.circular(14);

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: radius,
        border: Border.all(
          color: strokeColor,
          width: borderWidth,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: fgColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
