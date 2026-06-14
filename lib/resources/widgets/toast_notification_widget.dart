import '/bootstrap/extensions.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// ToastNotification provides a registry of toast notification styles.
/// Use [ToastNotification.styles] to get the default styles map.
class ToastNotification {
  /// Create a fully custom toast notification with a builder function.
  ///
  /// Use this when you want complete control over the toast's widget tree.
  /// Pair with a data-aware factory to access title, description, and custom data.
  ///
  /// Example:
  /// ```dart
  /// 'custom': (data) => ToastNotification.builder((context) {
  ///   return Container(
  ///     padding: EdgeInsets.all(16),
  ///     child: Text(data['description'] ?? ''),
  ///   );
  /// }, animation: ToastAnimation.springFromTop()),
  /// ```
  static ToastStyleFactory builder(
    Widget Function(BuildContext context) builder, {
    ToastNotificationPosition? position,
    Duration? duration,
    ToastAnimation? animation,
    ToastAnimation? reverseAnimation,
    bool? dismissOtherToast,
    TextDirection? textDirection,
    Alignment? alignment,
    Axis? axis,
    Offset? startOffset,
    Offset? endOffset,
    Offset? reverseStartOffset,
    Offset? reverseEndOffset,
    bool? isHideKeyboard,
    bool? isIgnoring,
    CustomAnimationBuilder? animationBuilder,
    CustomAnimationBuilder? reverseAnimBuilder,
    ToastOnInitStateCallback? onInitState,
  }) {
    return (ToastMeta meta, void Function(ToastMeta) updateMeta) {
      final updatedMeta = meta.copyWith(
        position: position,
        duration: duration,
        animation: meta.animation ?? animation,
        reverseAnimation: meta.reverseAnimation ?? reverseAnimation,
        dismissOtherToast: meta.dismissOtherToast ?? dismissOtherToast,
        textDirection: meta.textDirection ?? textDirection,
        alignment: meta.alignment ?? alignment,
        axis: meta.axis ?? axis,
        startOffset: meta.startOffset ?? startOffset,
        endOffset: meta.endOffset ?? endOffset,
        reverseStartOffset: meta.reverseStartOffset ?? reverseStartOffset,
        reverseEndOffset: meta.reverseEndOffset ?? reverseEndOffset,
        isHideKeyboard: meta.isHideKeyboard ?? isHideKeyboard,
        isIgnoring: meta.isIgnoring ?? isIgnoring,
        animationBuilder: meta.animationBuilder ?? animationBuilder,
        reverseAnimBuilder: meta.reverseAnimBuilder ?? reverseAnimBuilder,
        onInitState: meta.onInitState ?? onInitState,
      );
      updateMeta(updatedMeta);
      return Builder(builder: (context) => builder(context));
    };
  }

  /// Helper to create a toast style with defaults.
  ///
  /// Parameters:
  /// - [icon] - The icon widget to display
  /// - [color] - Background color for the icon section
  /// - [defaultTitle] - Title shown when no title is provided
  /// - [position] - Where the toast appears (top, bottom, center)
  /// - [duration] - How long the toast is displayed
  /// - [animation] - Animation style for the toast (e.g., ToastAnimation.fade())
  static ToastStyleFactory style({
    required Widget icon,
    required Color color,
    String? defaultTitle,
    ToastNotificationPosition? position,
    Duration? duration,
    ToastAnimation? animation,
    ToastAnimation? reverseAnimation,
    bool? dismissOtherToast,
    TextDirection? textDirection,
    Alignment? alignment,
    Axis? axis,
    Offset? startOffset,
    Offset? endOffset,
    Offset? reverseStartOffset,
    Offset? reverseEndOffset,
    bool? isHideKeyboard,
    bool? isIgnoring,
    CustomAnimationBuilder? animationBuilder,
    CustomAnimationBuilder? reverseAnimBuilder,
    ToastOnInitStateCallback? onInitState,
    Widget Function(ToastMeta toastMeta)? builder,
  }) {
    return (ToastMeta meta, void Function(ToastMeta) updateMeta) {
      final updatedMeta = meta.copyWith(
        icon: meta.icon ?? icon,
        color: meta.color ?? color,
        title: meta.title.isEmpty ? defaultTitle : null,
        position: position,
        duration: duration,
        animation: meta.animation ?? animation,
        reverseAnimation: meta.reverseAnimation ?? reverseAnimation,
        dismissOtherToast: meta.dismissOtherToast ?? dismissOtherToast,
        textDirection: meta.textDirection ?? textDirection,
        alignment: meta.alignment ?? alignment,
        axis: meta.axis ?? axis,
        startOffset: meta.startOffset ?? startOffset,
        endOffset: meta.endOffset ?? endOffset,
        reverseStartOffset: meta.reverseStartOffset ?? reverseStartOffset,
        reverseEndOffset: meta.reverseEndOffset ?? reverseEndOffset,
        isHideKeyboard: meta.isHideKeyboard ?? isHideKeyboard,
        isIgnoring: meta.isIgnoring ?? isIgnoring,
        animationBuilder: meta.animationBuilder ?? animationBuilder,
        reverseAnimBuilder: meta.reverseAnimBuilder ?? reverseAnimBuilder,
        onInitState: meta.onInitState ?? onInitState,
      );
      updateMeta(updatedMeta);
      if (builder != null) {
        return builder(updatedMeta);
      }
      return _ToastNotificationBase(updatedMeta);
    };
  }
}

/// Base toast notification widget that renders the common layout.
class _ToastNotificationBase extends StatelessWidget {
  const _ToastNotificationBase(this._toastMeta);

  final ToastMeta _toastMeta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 95,
          decoration: BoxDecoration(
            color: context.color.general.background,
            borderRadius: BorderRadius.circular(16),
            boxShadow: context.isThemeDark
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey.withAlpha(25),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: InkWell(
            onTap: _toastMeta.action != null
                ? () => _toastMeta.action!()
                : null,
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                // Icon section
                SizedBox(width: 50, child: Center(child: _toastMeta.icon)),
                // Content section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_toastMeta.title.tr()).bodyLarge(
                          color: context.color.general.content,
                          fontWeight: FontWeight.bold,
                        ),
                        if (_toastMeta.description.isNotEmpty)
                          Text(
                            _toastMeta.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ).bodyMedium(
                            color: context.color.general.content.withAlpha(200),
                          ),
                      ],
                    ),
                  ),
                ),
                // Dismiss button
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: _toastMeta.dismiss != null
                        ? () => _toastMeta.dismiss!()
                        : null,
                    icon: Icon(
                      Icons.close,
                      size: 18,
                      color: context.isThemeDark
                          ? Colors.white70
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
