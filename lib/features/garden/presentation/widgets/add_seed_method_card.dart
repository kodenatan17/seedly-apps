import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';

/// One selectable method row on `garden_add_seeds_screen.dart` (Scan QR /
/// Enter Code / Browse Catalogue).
class AddSeedMethodCard extends StatelessWidget {
  const AddSeedMethodCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseIcon(
            icon,
            size: 26,
            color: iconColor,
            backgroundColor: iconBackgroundColor,
            backgroundSize: 56,
            borderRadius: BorderRadius.circular(16),
          ),
          const BaseGap.h(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(title, style: AppTypography.headingS),
                const BaseGap.v(4),
                BaseText(
                  description,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          const BaseGap.h(8),
          const Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
