import 'package:flutter/material.dart';

import '../colors/colors.dart';

/// Rounded surface atom.
///
/// Supports a flat [backgroundColor] or a [gradient] fill, a solid
/// [borderColor] or a [borderGradient] ring, a shadow preset and an optional
/// tap handler with ink feedback.
class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.backgroundColor = AppColors.surface,
    this.gradient,
    this.borderRadius = 20,
    this.borderColor,
    this.borderWidth = 1,
    this.borderGradient,
    this.boxShadow = AppShadows.card,
    this.onTap,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final Gradient? gradient;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;

  /// Draws a gradient ring of [borderWidth] around the card. Takes precedence
  /// over [borderColor].
  final Gradient? borderGradient;
  final List<BoxShadow> boxShadow;
  final VoidCallback? onTap;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final outerRadius = BorderRadius.circular(borderRadius);
    final hasGradientBorder = borderGradient != null;
    final innerRadius = hasGradientBorder
        ? BorderRadius.circular(
            (borderRadius - borderWidth).clamp(0.0, borderRadius).toDouble(),
          )
        : outerRadius;

    final surface = Container(
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        borderRadius: innerRadius,
        border: !hasGradientBorder && borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: innerRadius,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );

    return Container(
      margin: margin,
      padding: hasGradientBorder ? EdgeInsets.all(borderWidth) : null,
      decoration: BoxDecoration(
        gradient: borderGradient,
        borderRadius: outerRadius,
        boxShadow: boxShadow,
      ),
      child: surface,
    );
  }
}
