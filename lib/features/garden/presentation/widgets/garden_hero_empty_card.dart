import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// "Your garden is waiting" hero card shown on first login, before any
/// container has a plant.
class GardenHeroEmptyCard extends StatelessWidget {
  const GardenHeroEmptyCard({
    super.key,
    required this.onAddFirstPlant,
    required this.onScanQr,
  });

  final VoidCallback onAddFirstPlant;
  final VoidCallback onScanQr;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.45],
        colors: [AppColors.yellowPale, AppColors.white],
      ),
      borderRadius: 24,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              const BaseIcon(
                Icons.spa,
                size: 56,
                color: AppColors.white,
                backgroundGradient: AppGradients.avatar,
                backgroundSize: 140,
              ),
              Positioned(
                bottom: -8,
                child: BaseBadge(
                  label: l10n.readyBadgeLabel,
                  icon: Icons.favorite,
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                ),
              ),
            ],
          ),
          const BaseGap.v(24),
          BaseText(
            l10n.gardenWaitingTitle,
            style: AppTypography.headingM,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(8),
          BaseText(
            l10n.gardenWaitingDescription,
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(24),
          BaseButton(
            label: l10n.addFirstPlantButton,
            leadingIcon: Icons.add,
            size: BaseButtonSize.large,
            isExpanded: true,
            onPressed: onAddFirstPlant,
          ),
          const BaseGap.v(10),
          BaseButton(
            label: l10n.scanSmartPotButton,
            leadingIcon: Icons.qr_code_scanner,
            variant: BaseButtonVariant.tonal,
            size: BaseButtonSize.large,
            isExpanded: true,
            onPressed: onScanQr,
          ),
        ],
      ),
    );
  }
}
