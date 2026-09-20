import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../colors/colors.dart';

/// Horizontal progress atom with an optional marker at the fill tip.
///
/// Built from [FractionallySizedBox] / [Align] rather than a `LayoutBuilder`
/// so it reports intrinsic dimensions and can live inside `IntrinsicHeight`,
/// `Table` cells and similar parents.
class BaseProgressBar extends StatelessWidget {
  const BaseProgressBar({
    super.key,
    required this.value,
    this.height = 8,
    this.backgroundColor = AppColors.divider,
    this.valueColor = AppColors.greenBright,
    this.borderRadius = 999,
    this.tipWidget,
    this.tipSize = 20,
    this.animationDuration = const Duration(milliseconds: 400),
  });

  /// Progress in the range `0.0 – 1.0`; values outside are clamped.
  final double value;
  final double height;
  final Color backgroundColor;
  final Color valueColor;
  final double borderRadius;

  /// Widget rendered on the end of the fill (e.g. a sprout icon).
  final Widget? tipWidget;
  final double tipSize;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0).toDouble();
    final radius = BorderRadius.circular(borderRadius);
    final trackHeight = tipWidget == null ? height : math.max(height, tipSize);

    return SizedBox(
      height: trackHeight,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: radius,
            ),
          ),
          AnimatedFractionallySizedBox(
            duration: animationDuration,
            curve: Curves.easeOut,
            alignment: Alignment.centerLeft,
            widthFactor: clamped,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: valueColor,
                borderRadius: radius,
              ),
            ),
          ),
          if (tipWidget != null)
            AnimatedAlign(
              duration: animationDuration,
              curve: Curves.easeOut,
              // Maps 0..1 onto Alignment x -1..1 so the marker sits on the
              // fill edge and stays inside the track at both extremes.
              alignment: Alignment(clamped * 2 - 1, 0),
              child: SizedBox.square(dimension: tipSize, child: tipWidget),
            ),
        ],
      ),
    );
  }
}
