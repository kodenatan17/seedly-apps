import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';
import '../../models/achievement_ui_model.dart';

/// Celebration header: "Achievement Unlocked" pill, title, glowing medal,
/// medal name and congratulation message.
class UnlockedMedalHero extends StatelessWidget {
  const UnlockedMedalHero({super.key, required this.model});

  final UnlockedAchievementUiModel model;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        BaseBadge(
          label: l10n.achievementUnlockedBadge,
          icon: Icons.celebration,
          backgroundColor: AppColors.yellowLight,
          foregroundColor: AppColors.yellowText,
          textStyle: AppTypography.labelS,
        ),
        const BaseGap.v(12),
        BaseText(
          l10n.newMedalUnlockedTitle,
          style: AppTypography.headingL,
          textAlign: TextAlign.center,
        ),
        const BaseGap.v(24),
        const _GlowingMedal(),
        const BaseGap.v(24),
        BaseText(
          model.medalName,
          style: AppTypography.headingM,
          textAlign: TextAlign.center,
        ),
        const BaseGap.v(8),
        BaseText(
          l10n.unlockedMedalMessage(model.petName),
          style: AppTypography.bodyL,
          color: AppColors.textSecondary,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _GlowingMedal extends StatelessWidget {
  const _GlowingMedal();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            right: 8,
            child: BaseIcon(
              Icons.auto_awesome,
              size: 20,
              color: AppColors.gold,
            ),
          ),
          Positioned(
            top: 28,
            left: 0,
            child: BaseIcon(Icons.star, size: 16, color: AppColors.yellow),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            child: BaseIcon(
              Icons.auto_awesome,
              size: 14,
              color: AppColors.gold,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: AppShadows.glowGreen,
            ),
            child: BaseIcon(
              Icons.yard,
              size: 60,
              color: AppColors.gold,
              backgroundColor: AppColors.white,
              backgroundSize: 140,
              borderColor: AppColors.greenBorder,
              borderWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}
