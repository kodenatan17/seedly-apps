import 'package:flutter/material.dart';

import '../colors/colors.dart';

/// Icon atom with an optional tinted / gradient background.
///
/// Without a background it renders a plain [Icon]. With [backgroundColor] or
/// [backgroundGradient] it renders the icon centred in a circle (or a rounded
/// rectangle when [borderRadius] is given), optionally ringed by a border.
class BaseIcon extends StatelessWidget {
  const BaseIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color = AppColors.textPrimary,
    this.backgroundColor,
    this.backgroundGradient,
    this.backgroundSize,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 0,
    this.semanticLabel,
  });

  final IconData icon;
  final double size;
  final Color color;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;

  /// Diameter / side of the background. Defaults to twice the icon [size].
  final double? backgroundSize;

  /// When set, the background becomes a rounded rectangle instead of a circle.
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );

    if (backgroundColor == null && backgroundGradient == null) {
      return iconWidget;
    }

    final dimension = backgroundSize ?? size * 2;
    final border = borderColor == null || borderWidth <= 0
        ? null
        : Border.all(color: borderColor!, width: borderWidth);

    return Container(
      width: dimension,
      height: dimension,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundGradient == null ? backgroundColor : null,
        gradient: backgroundGradient,
        shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: borderRadius,
        border: border,
      ),
      child: iconWidget,
    );
  }
}
