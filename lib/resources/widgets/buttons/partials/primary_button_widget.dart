import 'package:flutter/material.dart';
import '/resources/widgets/buttons/abstract/app_button.dart';

class PrimaryButton extends StatefulAppButton {
  final Color? backgroundColor;
  final Color? contentColor;
  final double? elevation;

  PrimaryButton({
    super.key,
    required super.text,
    super.onPressed,
    super.submitForm,
    super.onFailure,
    super.showToastError = true,
    super.loadingStyle,
    super.width,
    super.height,
    super.animationStyle,
    super.splashStyle,
    this.backgroundColor,
    this.contentColor,
    this.elevation,
  });

  @override
  Widget buildButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final Color bgColor = backgroundColor ?? theme.colorScheme.primary;
    final Color fgColor = contentColor ?? theme.colorScheme.onPrimary;
    final BorderRadius radius = BorderRadius.circular(14);

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade400.withValues(alpha: isDark ? 0.3 : 0.25),
            blurRadius: elevation ?? 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          if (!isDark)
            BoxShadow(
              color: Colors.grey.shade400.withValues(alpha: 0.15),
              blurRadius: 4,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: fgColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
