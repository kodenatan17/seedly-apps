import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../models/container_slot_ui_model.dart';

/// One "Smart Pot" tile on `garden_choose_container_screen.dart`.
class ContainerSlotCard extends StatelessWidget {
  const ContainerSlotCard({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  final ContainerSlotUiModel slot;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectable = slot.isSelectable;

    return BaseCard(
      onTap: selectable ? onTap : null,
      backgroundColor: selectable ? AppColors.white : AppColors.lockedSurface,
      borderColor: isSelected ? AppColors.greenDark : AppColors.border,
      borderWidth: isSelected ? 2 : 1,
      boxShadow: isSelected ? AppShadows.card : AppShadows.none,
      child: Column(
        children: [
          BaseIcon(
            Icons.yard,
            size: 28,
            color: selectable ? AppColors.greenDark : AppColors.textMuted,
            backgroundColor: selectable
                ? AppColors.greenLight
                : AppColors.divider,
            backgroundSize: 64,
          ),
          const BaseGap.v(12),
          BaseText(
            l10n.smartPotLabel(slot.label),
            style: AppTypography.titleS,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(6),
          if (selectable)
            BaseBadge(
              label: l10n.containerReadyStatus,
              backgroundColor: AppColors.greenLight,
              foregroundColor: AppColors.greenDark,
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 14,
                  color: AppColors.error,
                ),
                const BaseGap.h(4),
                Flexible(
                  child: BaseText(
                    l10n.containerFullStatus,
                    style: AppTypography.caption,
                    color: AppColors.error,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
