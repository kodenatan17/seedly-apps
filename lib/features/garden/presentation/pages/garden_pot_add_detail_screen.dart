import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// Smart Pot pairing detail — route entry point, exported by
/// `public_api.dart`. Presentation-only; navigation via callbacks.
class GardenPotAddDetailScreen extends StatelessWidget {
  const GardenPotAddDetailScreen({
    super.key,
    this.onBack,
    this.onClose,
    required this.onConfirm,
  });

  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: BaseAppBar(
        title: 'Connect Your Smart Pot',
        onBack: onBack,
        onClose: onClose,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const BaseIcon(
                      Icons.wifi_tethering,
                      size: 44,
                      color: AppColors.white,
                      backgroundColor: AppColors.greenDark,
                      backgroundSize: 112,
                    ),
                    const BaseGap.v(12),
                    const BaseBadge(label: 'BLE 5.2'),
                  ],
                ),
              ),
              const BaseGap.v(16),
              const BaseText(
                'Seedly Smart Grow Pot v2',
                style: AppTypography.bodyM,
                color: AppColors.textSecondary,
              ),
              const BaseGap.v(12),
              const Row(
                children: [
                  BaseBadge(label: 'BLE 5.2 Auto-Pair'),
                  BaseGap.h(8),
                  BaseBadge(label: 'Hydro-Substrate Ready'),
                ],
              ),
              const BaseGap.v(16),
              BaseCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: BaseText(
                            'Smart Pot Capabilities',
                            style: AppTypography.titleM,
                          ),
                        ),
                        const BaseBadge(label: 'Active Mesh'),
                      ],
                    ),
                    const BaseGap.v(12),
                    const _CapabilityRow(
                      icon: Icons.water_drop_outlined,
                      label: 'Live Soil Moisture & Temp Telemetry',
                    ),
                    const BaseGap.v(8),
                    const _CapabilityRow(
                      icon: Icons.wb_sunny_outlined,
                      label: 'Ambient Lux & Photoperiod Tracker',
                    ),
                    const BaseGap.v(8),
                    const _CapabilityRow(
                      icon: Icons.eco_outlined,
                      label: '3-Seed Reservoir Capacity',
                    ),
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

class _CapabilityRow extends StatelessWidget {
  const _CapabilityRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaseIcon(
          icon,
          size: 18,
          color: AppColors.greenDark,
          backgroundColor: AppColors.greenPale,
          backgroundSize: 36,
        ),
        const BaseGap.h(12),
        Expanded(child: BaseText(label, style: AppTypography.bodyM)),
      ],
    );
  }
}
