import 'package:flutter/material.dart';

import '../atoms/base_gap.dart';
import '../atoms/base_text.dart';
import '../colors/colors.dart';
import '../typograph/typograph.dart';

/// Horizontal rule with a centred label — the `or` / `or register with`
/// separators between a form and its social sign-in option.
class BaseDividerLabel extends StatelessWidget {
  const BaseDividerLabel(
    this.label, {
    super.key,
    this.color = AppColors.border,
    this.style = AppTypography.bodyS,
  });

  final String label;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: color)),
        const BaseGap.h(12),
        BaseText(label, style: style, color: AppColors.textMuted),
        const BaseGap.h(12),
        Expanded(child: Container(height: 1, color: color)),
      ],
    );
  }
}
