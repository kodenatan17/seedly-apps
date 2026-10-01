import 'package:flutter/material.dart';

import '../atoms/base_card.dart';
import '../atoms/base_gap.dart';
import '../atoms/base_icon.dart';
import '../atoms/base_text.dart';
import '../colors/colors.dart';
import '../typograph/typograph.dart';

/// Tinted reassurance banner: icon in a circle, optional bold title and a
/// supporting paragraph (privacy note, spam-folder hint, support pointer).
class BaseInfoBanner extends StatelessWidget {
  const BaseInfoBanner({
    super.key,
    required this.icon,
    required this.description,
    this.title,
    this.backgroundColor = AppColors.blueSurface,
    this.iconColor = AppColors.blueDark,
    this.iconBackgroundColor = AppColors.blueLight,
    this.textAlign = TextAlign.start,
  });

  final IconData icon;
  final String description;
  final String? title;
  final Color backgroundColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: backgroundColor,
      boxShadow: AppShadows.none,
      borderRadius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseIcon(
            icon,
            size: 20,
            color: iconColor,
            backgroundColor: iconBackgroundColor,
            backgroundSize: 40,
          ),
          const BaseGap.h(12),
          Expanded(
            child: Column(
              crossAxisAlignment: textAlign == TextAlign.center
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  BaseText(
                    title!,
                    style: AppTypography.titleS,
                    textAlign: textAlign,
                  ),
                  const BaseGap.v(4),
                ],
                BaseText(
                  description,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                  textAlign: textAlign,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
