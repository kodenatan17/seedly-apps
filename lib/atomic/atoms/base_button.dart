import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../typograph/typograph.dart';
import 'base_gap.dart';
import 'base_text.dart';

enum BaseButtonVariant { primary, secondary, tonal, outline, text }

enum BaseButtonSize { small, medium, large }

/// Button atom.
///
/// [variant] picks the default colours (overridable via [backgroundColor] /
/// [foregroundColor]); [size] picks height, padding, text style and icon size.
/// [isLoading] replaces the leading icon with a spinner and disables taps.
class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = BaseButtonVariant.primary,
    this.size = BaseButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isExpanded = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  final String label;
  final VoidCallback? onPressed;
  final BaseButtonVariant variant;
  final BaseButtonSize size;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final palette = _paletteFor(variant);
    final metrics = _metricsFor(size);
    final bg = backgroundColor ?? palette.background;
    final fg = foregroundColor ?? palette.foreground;
    final effectiveOnPressed = isLoading ? null : onPressed;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox.square(
            dimension: metrics.iconSize,
            child: CircularProgressIndicator(strokeWidth: 2, color: fg),
          )
        else if (leadingIcon != null)
          Icon(leadingIcon, size: metrics.iconSize, color: fg),
        if (isLoading || leadingIcon != null) const BaseGap.h(8),
        Flexible(
          child: BaseText(
            label,
            style: metrics.textStyle,
            color: fg,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        if (trailingIcon != null) ...[
          const BaseGap.h(8),
          Icon(trailingIcon, size: metrics.iconSize, color: fg),
        ],
      ],
    );

    final style = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(bg),
      foregroundColor: WidgetStatePropertyAll(fg),
      overlayColor: WidgetStatePropertyAll(fg.withValues(alpha: 0.08)),
      elevation: const WidgetStatePropertyAll(0),
      minimumSize: WidgetStatePropertyAll(Size(0, metrics.height)),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: metrics.horizontalPadding),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(999),
          side: variant == BaseButtonVariant.outline
              ? BorderSide(color: palette.border ?? AppColors.border)
              : BorderSide.none,
        ),
      ),
    );

    final Widget button = switch (variant) {
      BaseButtonVariant.text => TextButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: content,
      ),
      BaseButtonVariant.outline => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: content,
      ),
      _ => FilledButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: content,
      ),
    };

    return isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  static _Palette _paletteFor(BaseButtonVariant variant) => switch (variant) {
    BaseButtonVariant.primary => const _Palette(
      background: AppColors.greenDark,
      foreground: AppColors.white,
    ),
    BaseButtonVariant.secondary => const _Palette(
      background: AppColors.blueLight,
      foreground: AppColors.blueDark,
    ),
    BaseButtonVariant.tonal => const _Palette(
      background: AppColors.greenLight,
      foreground: AppColors.greenDark,
    ),
    BaseButtonVariant.outline => const _Palette(
      background: AppColors.transparent,
      foreground: AppColors.greenDark,
      border: AppColors.border,
    ),
    BaseButtonVariant.text => const _Palette(
      background: AppColors.transparent,
      foreground: AppColors.greenDark,
    ),
  };

  static _Metrics _metricsFor(BaseButtonSize size) => switch (size) {
    BaseButtonSize.small => const _Metrics(
      height: 36,
      horizontalPadding: 12,
      textStyle: AppTypography.labelS,
      iconSize: 16,
    ),
    BaseButtonSize.medium => const _Metrics(
      height: 44,
      horizontalPadding: 16,
      textStyle: AppTypography.labelM,
      iconSize: 18,
    ),
    BaseButtonSize.large => const _Metrics(
      height: 52,
      horizontalPadding: 20,
      textStyle: AppTypography.button,
      iconSize: 20,
    ),
  };
}

class _Palette {
  const _Palette({
    required this.background,
    required this.foreground,
    this.border,
  });

  final Color background;
  final Color foreground;
  final Color? border;
}

class _Metrics {
  const _Metrics({
    required this.height,
    required this.horizontalPadding,
    required this.textStyle,
    required this.iconSize,
  });

  final double height;
  final double horizontalPadding;
  final TextStyle textStyle;
  final double iconSize;
}
