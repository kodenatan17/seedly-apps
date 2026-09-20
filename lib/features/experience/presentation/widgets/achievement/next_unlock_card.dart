import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';

/// Light-blue "NEXT UNLOCK" card with a chevron leading to the medal journey.
class NextUnlockCard extends StatelessWidget {
  const NextUnlockCard({
    super.key,
    required this.name,
    required this.description,
    required this.milestones,
    this.onTap,
  });

  final String name;
  final String description;
  final int milestones;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      backgroundColor: AppColors.bluePale,
      borderColor: AppColors.blueLight,
      boxShadow: AppShadows.none,
      onTap: onTap,
      child: Row(
        children: [
          const BaseIcon(
            Icons.park,
            size: 26,
            color: AppColors.blueDark,
            backgroundColor: AppColors.blueLight,
            backgroundSize: 52,
          ),
          const BaseGap.h(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BaseBadge(
                      label: l10n.nextUnlockLabel,
                      backgroundColor: AppColors.blueLight,
                      foregroundColor: AppColors.blueDark,
                      textStyle: AppTypography.overline,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                    ),
                    const BaseGap.h(8),
                    Expanded(
                      child: BaseText(
                        l10n.milestonesCount(milestones),
                        style: AppTypography.caption,
                        color: AppColors.textSecondary,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const BaseGap.v(6),
                BaseText(name, style: AppTypography.headingS),
                const BaseGap.v(2),
                BaseText(
                  description,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          const BaseGap.h(12),
          const BaseIcon(
            Icons.chevron_right,
            size: 22,
            color: AppColors.white,
            backgroundColor: AppColors.blueDark,
            backgroundSize: 36,
          ),
        ],
      ),
    );
  }
}
