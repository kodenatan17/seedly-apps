import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';
import '../../models/achievement_ui_model.dart';

/// Big white card showing the current medal avatar, quote and milestone
/// progress panel.
class CurrentMedalCard extends StatelessWidget {
  const CurrentMedalCard({super.key, required this.summary, this.onTap});

  final AchievementSummaryUiModel summary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      child: Column(
        children: [
          _MedalAvatar(level: summary.level),
          const BaseGap.v(16),
          BaseText(
            l10n.currentMedalLabel,
            style: AppTypography.overline,
            color: AppColors.textSecondary,
            letterSpacing: 1.5,
          ),
          const BaseGap.v(4),
          BaseText(summary.currentMedalName, style: AppTypography.headingM),
          const BaseGap.v(12),
          BaseText(
            summary.quote,
            style: AppTypography.bodyL,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(20),
          _MilestoneProgressPanel(summary: summary),
        ],
      ),
    );
  }
}

class _MedalAvatar extends StatelessWidget {
  const _MedalAvatar({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const BaseIcon(
          Icons.eco,
          size: 44,
          color: AppColors.white,
          backgroundGradient: AppGradients.avatar,
          backgroundSize: 96,
        ),
        Positioned(
          bottom: -8,
          child: BaseBadge(
            label: context.l10n.levelShort(level),
            backgroundColor: AppColors.yellow,
            foregroundColor: AppColors.yellowText,
            textStyle: AppTypography.labelS,
          ),
        ),
      ],
    );
  }
}

class _MilestoneProgressPanel extends StatelessWidget {
  const _MilestoneProgressPanel({required this.summary});

  final AchievementSummaryUiModel summary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      backgroundColor: AppColors.greenPale,
      boxShadow: AppShadows.none,
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: BaseText(
                  l10n.milestonesProgressTitle,
                  style: AppTypography.titleS,
                  color: AppColors.greenDarkest,
                ),
              ),
              BaseText(
                l10n.progressFraction(
                  summary.milestonesCurrent,
                  summary.milestonesTotal,
                ),
                style: AppTypography.titleS,
                color: AppColors.greenDarkest,
              ),
            ],
          ),
          const BaseGap.v(12),
          BaseProgressBar(
            value: summary.progress,
            height: 10,
            backgroundColor: AppColors.greenLight,
            valueColor: AppColors.greenDark,
            tipWidget: const BaseIcon(
              Icons.grass,
              size: 11,
              color: AppColors.greenDark,
              backgroundColor: AppColors.white,
              backgroundSize: 20,
              borderColor: AppColors.greenDark,
              borderWidth: 1.5,
            ),
          ),
          const BaseGap.v(10),
          Row(
            children: [
              Expanded(
                child: BaseText(
                  l10n.milestonesToNextRank(summary.remaining),
                  style: AppTypography.caption,
                  color: AppColors.textSecondary,
                ),
              ),
              BaseText(
                l10n.percentCompleted(summary.percent),
                style: AppTypography.caption,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
