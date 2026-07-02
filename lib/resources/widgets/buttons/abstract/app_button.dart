import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class _SubmitFormHolder {
  (dynamic, Function(dynamic data))? submitForm;
  Function(dynamic error)? onFailure;
  _SubmitFormHolder({this.submitForm, this.onFailure});
}

abstract class StatefulAppButton extends StatelessWidget with FormSubmittable {
  final String text;
  final VoidCallback? onPressed;
  final _SubmitFormHolder _submitHolder;
  final bool showToastError;
  final LoadingStyle? loadingStyle;
  final double? width;
  final double height;
  final ButtonAnimationStyle? animationStyle;
  final ButtonSplashStyle? splashStyle;

  (dynamic, Function(dynamic data))? get submitForm => _submitHolder.submitForm;
  Function(dynamic error)? get onFailure => _submitHolder.onFailure;

  StatefulAppButton({
    super.key,
    required this.text,
    this.onPressed,
    (dynamic, Function(dynamic data))? submitForm,
    Function(dynamic error)? onFailure,
    this.showToastError = true,
    this.loadingStyle,
    this.width,
    this.height = 50,
    this.animationStyle,
    this.splashStyle,
  }) : _submitHolder = _SubmitFormHolder(submitForm: submitForm, onFailure: onFailure);

  @override
  Widget withSubmitForm(
    (dynamic, Function(dynamic data)) submitForm, {
    Function(dynamic error)? onFailure,
  }) {
    _submitHolder.submitForm = submitForm;
    if (onFailure != null) _submitHolder.onFailure = onFailure;
    return this;
  }

  /// Build the actual button widget
  Widget buildButton(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ButtonState(
      onSubmit: (onPressed, submitForm),
      onFailure: onFailure,
      showToastError: showToastError,
      loadingStyle: loadingStyle ?? LoadingStyle.skeletonizer(),
      child: (VoidCallback? pressed) {
        Widget result = buildButton(context);

        final bool hasAnimation = animationStyle != null &&
            animationStyle!.type != ButtonAnimationType.none;
        final bool hasSplash = splashStyle != null &&
            splashStyle!.type != ButtonSplashType.none;

        // Apply splash styling to the button
        if (hasSplash) {
          result = Material(
            color: Colors.transparent,
            child: SizedBox(
              height: height,
              child: InkWell(
                // Only add tap handler if no animation (animation wrapper handles tap otherwise)
                onTap: hasAnimation ? null : pressed,
                borderRadius: splashStyle?.borderRadius ?? BorderRadius.circular(14),
                splashColor: splashStyle?.getSplashColor(
                    context, Theme.of(context).colorScheme.onSurface),
                highlightColor: splashStyle?.getHighlightColor(
                    context, Theme.of(context).colorScheme.onSurface),
                splashFactory: splashStyle?.splashFactory,
                overlayColor: splashStyle?.getOverlayColor(),
                child: result,
              ),
            ),
          );
        }

        // Apply animation wrapper (includes splash if both are set)
        if (hasAnimation) {
          return AnimatedButtonWrapper(
            animationStyle: animationStyle!,
            onPressed: pressed,
            child: result,
          );
        }

        // If splash is set, InkWell already handles tap
        if (hasSplash) {
          return result;
        }

        // Default: use GestureDetector
        return GestureDetector(
          onTap: pressed,
          behavior: HitTestBehavior.opaque,
          child: result,
        );
      },
    );
  }
}