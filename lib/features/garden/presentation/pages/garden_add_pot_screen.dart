import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../widgets/add_seed_method_card.dart';

/// "Add Smart Pot" method picker — route entry point, exported by
/// `public_api.dart`. Navigation is injected through callbacks.
class GardenAddPotScreen extends StatelessWidget {
  const GardenAddPotScreen({
    super.key,
    this.onBack,
    this.onClose,
    required this.onScanQr,
    required this.onEnterCode,
  });

  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final VoidCallback onScanQr;
  final VoidCallback onEnterCode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: BaseAppBar(
        title: 'Add Smart Pot',
        onBack: onBack,
        onClose: onClose,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                l10n.addSeedQuestion,
                style: AppTypography.headingS,
                color: AppColors.textSecondary,
              ),
              const BaseGap.v(24),
              AddSeedMethodCard(
                icon: Icons.qr_code_2,
                iconBackgroundColor: AppColors.yellow,
                iconColor: AppColors.yellowText,
                title: l10n.scanQrMethodTitle,
                description: l10n.scanQrMethodDescription,
                onTap: onScanQr,
              ),
              const BaseGap.v(16),
              AddSeedMethodCard(
                icon: Icons.keyboard_alt_outlined,
                iconBackgroundColor: AppColors.greenDark,
                iconColor: AppColors.white,
                title: l10n.enterCodeMethodTitle,
                description: l10n.enterCodeMethodDescription,
                onTap: onEnterCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
