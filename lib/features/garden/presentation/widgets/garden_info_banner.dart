import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';

/// Small "Zero stress, 100% fun!" reassurance banner.
class GardenInfoBanner extends StatelessWidget {
  const GardenInfoBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: AppColors.blueSurface,
      boxShadow: AppShadows.none,
      borderRadius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseIcon(
            icon,
            size: 20,
            color: AppColors.yellowText,
            backgroundColor: AppColors.yellow,
            backgroundSize: 40,
          ),
          const BaseGap.h(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(title, style: AppTypography.titleS),
                const BaseGap.v(2),
                BaseText(
                  description,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
