import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';
import '../../models/achievement_ui_model.dart';

/// Grid tile for an earned medal, with a green check badge in the corner.
class UnlockedMedalTile extends StatelessWidget {
  const UnlockedMedalTile({super.key, required this.medal});

  final UnlockedMedalUiModel medal;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseIcon(
                  medal.icon,
                  size: 26,
                  color: AppColors.greenDark,
                  backgroundColor: AppColors.lavender,
                  backgroundSize: 56,
                ),
                const BaseGap.v(12),
                BaseText(
                  medal.name,
                  style: AppTypography.titleS,
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                const BaseGap.v(2),
                BaseText(
                  context.l10n.milestoneNumber(medal.milestone),
                  style: AppTypography.caption,
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: BaseIcon(
              Icons.check,
              size: 12,
              color: AppColors.white,
              backgroundColor: AppColors.greenDark,
              backgroundSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
