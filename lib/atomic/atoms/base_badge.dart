import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../typograph/typograph.dart';
import 'base_gap.dart';
import 'base_text.dart';

/// Pill-shaped label atom (e.g. "Level 5", "NEXT UNLOCK").
class BaseBadge extends StatelessWidget {
  const BaseBadge({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.greenLight,
    this.foregroundColor = AppColors.greenDark,
    this.icon,
    this.iconSize = 14,
    this.textStyle = AppTypography.labelS,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.borderRadius = 999,
  });

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? icon;
  final double iconSize;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: iconSize, color: foregroundColor),
            const BaseGap.h(4),
          ],
          BaseText(label, style: textStyle, color: foregroundColor),
        ],
      ),
    );
  }
}
