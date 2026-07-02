import 'package:flutter/material.dart';
import '/resources/widgets/buttons/abstract/app_button.dart';

class RoundedButton extends StatefulAppButton {
  final Color? contentColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  RoundedButton({
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
    this.backgroundColor,
    this.borderRadius,
    super.width,
    super.height,
  });

  @override
  Widget buildButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final Color bgColor = backgroundColor ?? theme.colorScheme.primaryContainer;
    final Color fgColor = contentColor ?? theme.colorScheme.onPrimaryContainer;
    final BorderRadius radius = borderRadius ?? BorderRadius.circular(height / 2);

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
        boxShadow: isDark
            ? null
            : <BoxShadow>[
                BoxShadow(
                  color: bgColor.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            text,
            style: TextStyle(
              color: fgColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
