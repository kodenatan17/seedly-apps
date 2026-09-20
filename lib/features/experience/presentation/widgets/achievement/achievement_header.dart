import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';

/// "Garden Mastery" title row with the level pill and the intro paragraph.
class AchievementHeader extends StatelessWidget {
  const AchievementHeader({
    super.key,
    required this.level,
    required this.subtitle,
  });

  final int level;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BaseText(
                l10n.gardenMasteryTitle,
                style: AppTypography.headingL,
                color: AppColors.greenDark,
              ),
            ),
            const BaseGap.h(12),
            BaseBadge(
              label: l10n.levelLabel(level),
              icon: Icons.military_tech,
              textStyle: AppTypography.labelM,
            ),
          ],
        ),
        const BaseGap.v(8),
        BaseText(
          subtitle,
          style: AppTypography.bodyM,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}
