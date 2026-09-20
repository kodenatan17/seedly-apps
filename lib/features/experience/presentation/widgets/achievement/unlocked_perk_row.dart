import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';

/// "Unlocked Perk" row with a gift icon and the perk description.
class UnlockedPerkRow extends StatelessWidget {
  const UnlockedPerkRow({super.key, required this.perk});

  final String perk;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: AppColors.white,
      boxShadow: AppShadows.none,
      borderRadius: 16,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const BaseIcon(
            Icons.card_giftcard,
            size: 22,
            color: AppColors.yellowText,
            backgroundColor: AppColors.yellowLight,
            backgroundSize: 44,
          ),
          const BaseGap.h(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  context.l10n.unlockedPerkLabel,
                  style: AppTypography.titleS,
                ),
                const BaseGap.v(2),
                BaseText(
                  perk,
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
