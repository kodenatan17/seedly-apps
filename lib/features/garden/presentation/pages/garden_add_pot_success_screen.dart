import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// Smart Pot pairing success — route entry point, exported by
/// `public_api.dart`. Presentation-only; navigation via callbacks.
class GardenAddPotSuccessScreen extends StatelessWidget {
  const GardenAddPotSuccessScreen({
    super.key,
    this.potName = 'Smart Pot Alpha',
    this.potId = '#LET-04',
    this.batteryPercent = 95,
    this.waterPercent = 100,
    this.placedSeeds = 0,
    this.seedCapacity = 3,
    this.onConfirm,
    this.onClose,
  });

  final String potName;
  final String potId;
  final int batteryPercent;
  final int waterPercent;
  final int placedSeeds;
  final int seedCapacity;
  final VoidCallback? onConfirm;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: BaseAppBar(
        title: 'GROWPICO OS',
        showBack: false,
        onClose: onClose,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BaseBadge(label: 'Smart Pot Connected!'),
              const BaseGap.v(16),
              // Real hero image asset is pending — placeholder icon for now.
              const BaseCard(
                child: Center(
                  child: BaseIcon(
                    Icons.eco_outlined,
                    size: 56,
                    color: AppColors.white,
                    backgroundColor: AppColors.greenDark,
                    backgroundSize: 128,
                  ),
                ),
              ),
              const BaseGap.v(16),
              BaseText(
                l10n.smartPotReadyTitle(potName),
                style: AppTypography.headingM,
                color: AppColors.greenDark,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(8),
              BaseText(
                l10n.smartPotReadyDescription,
                style: AppTypography.bodyM,
                color: AppColors.textSecondary,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(16),
              BaseCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const BaseIcon(
                          Icons.eco_outlined,
                          size: 22,
                          color: AppColors.white,
                          backgroundColor: AppColors.greenDark,
                          backgroundSize: 44,
                        ),
                        const BaseGap.h(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(potName, style: AppTypography.titleS),
                              BaseText(
                                potId,
                                style: AppTypography.bodyS,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ),
                        const BaseBadge(label: 'Online'),
                      ],
                    ),
                    const BaseGap.v(12),
                    _InfoRow(
                      label: 'Seed Capacity',
                      value: '$placedSeeds/$seedCapacity',
                    ),
                    const BaseGap.v(8),
                    const _InfoRow(label: 'Hardware Status', value: 'OK'),
                    const BaseGap.v(8),
                    _InfoRow(label: 'Battery', value: '$batteryPercent%'),
                    const BaseGap.v(8),
                    _InfoRow(label: 'Water', value: '$waterPercent%'),
                  ],
                ),
              ),
              const BaseGap.v(24),
              BaseButton(
                label: l10n.confirmSmartPotButton,
                isExpanded: true,
                size: BaseButtonSize.large,
                onPressed: onConfirm,
              ),
              const BaseGap.v(12),
              BaseText(
                l10n.iotSyncFooterNote,
                style: AppTypography.bodyS,
                color: AppColors.textSecondary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseText(
            label,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
          ),
        ),
        BaseText(value, style: AppTypography.titleS),
      ],
    );
  }
}
