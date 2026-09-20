import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';
import '../../models/achievement_ui_model.dart';

/// Gradient header card for the medal journey with three summary stats.
class MedalJourneyHeaderCard extends StatelessWidget {
  const MedalJourneyHeaderCard({super.key, required this.journey});

  final MedalJourneyUiModel journey;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      gradient: AppGradients.journeyHeader,
      borderColor: AppColors.greenLight,
      boxShadow: AppShadows.none,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseIcon(
                Icons.military_tech,
                size: 24,
                color: AppColors.white,
                backgroundColor: AppColors.green,
                backgroundSize: 44,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              const BaseGap.h(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      l10n.medalJourneyLabel,
                      style: AppTypography.labelS,
                      color: AppColors.textSecondary,
                    ),
                    const BaseGap.v(4),
                    BaseText(
                      l10n.medalJourneyDescription,
                      style: AppTypography.bodyM,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const BaseGap.v(20),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _StatColumn(
                    value: l10n.tierValue(journey.currentTier),
                    label: l10n.currentRankLabel,
                  ),
                ),
                const _StatDivider(),
                Expanded(
                  child: _StatColumn(
                    value: l10n.progressFraction(
                      journey.milestonesCurrent,
                      journey.milestonesTotal,
                    ),
                    label: l10n.milestonesLabel,
                  ),
                ),
                const _StatDivider(),
                Expanded(
                  child: _StatColumn(
                    value: l10n.leftValue(journey.leftToNextTier),
                    label: l10n.toNextTierLabel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseText(
          value,
          style: AppTypography.titleM,
          color: AppColors.greenDark,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        const BaseGap.v(4),
        BaseText(
          label,
          style: AppTypography.caption,
          color: AppColors.textSecondary,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: AppColors.greenBorder,
    );
  }
}
