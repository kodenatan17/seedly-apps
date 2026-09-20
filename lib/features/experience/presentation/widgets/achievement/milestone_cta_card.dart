import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';

/// Dark-green call-to-action card at the bottom of the medal journey.
class MilestoneCtaCard extends StatelessWidget {
  const MilestoneCtaCard({
    super.key,
    required this.nextTierName,
    this.onViewMissions,
  });

  final String nextTierName;
  final VoidCallback? onViewMissions;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      gradient: AppGradients.cta,
      boxShadow: AppShadows.none,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const BaseIcon(
            Icons.eco,
            size: 24,
            color: AppColors.white,
            backgroundColor: AppColors.whiteOverlay,
            backgroundSize: 44,
          ),
          const BaseGap.v(12),
          BaseText(
            l10n.keepRootsGrowingTitle,
            style: AppTypography.headingS,
            color: AppColors.white,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(8),
          BaseText(
            l10n.keepRootsGrowingDescription(nextTierName),
            style: AppTypography.bodyM,
            color: AppColors.whiteMuted,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(20),
          BaseButton(
            label: l10n.viewTodaysMissions,
            onPressed: onViewMissions,
            variant: BaseButtonVariant.tonal,
            backgroundColor: AppColors.greenBright,
            foregroundColor: AppColors.greenDarkest,
            size: BaseButtonSize.large,
            isExpanded: true,
          ),
        ],
      ),
    );
  }
}
