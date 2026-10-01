import 'package:flutter/material.dart';

import '../atoms/base_text.dart';
import '../colors/colors.dart';
import '../typograph/typograph.dart';

/// Inline tappable text — the underlined "Log In" / "Forgot password?" links
/// that sit inside sentences.
class BaseTextLink extends StatelessWidget {
  const BaseTextLink(
    this.label, {
    super.key,
    this.onTap,
    this.style = AppTypography.titleS,
    this.color = AppColors.greenDark,
    this.underline = true,
  });

  final String label;
  final VoidCallback? onTap;
  final TextStyle style;
  final Color color;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: BaseText(
          label,
          style: style,
          color: color,
          decoration: underline ? TextDecoration.underline : null,
        ),
      ),
    );
  }
}
