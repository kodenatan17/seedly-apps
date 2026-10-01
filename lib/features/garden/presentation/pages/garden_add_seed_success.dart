import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// Plant-added celebration screen — route entry point, exported by
/// `public_api.dart`.
class GardenAddSeedSuccessScreen extends StatelessWidget {
  const GardenAddSeedSuccessScreen({
    super.key,
    required this.plantName,
    this.growthDay = 1,
    this.onClose,
    required this.onGoToGarden,
  });

  final String plantName;
  final int growthDay;
  final VoidCallback? onClose;
  final VoidCallback onGoToGarden;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: AppShadows.glowGreen,
                    ),
                    child: BaseIcon(
                      Icons.emoji_nature,
                      size: 64,
                      color: AppColors.white,
                      backgroundGradient: AppGradients.avatar,
                      backgroundSize: 156,
                      borderColor: AppColors.greenBorder,
                      borderWidth: 8,
                    ),
                  ),
                  const BaseGap.v(28),
                  BaseText(
                    l10n.plantJoinedTitle(plantName),
                    style: AppTypography.headingL,
                    color: AppColors.greenDark,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(10),
                  BaseText(
                    l10n.growthJourneyBeginsToday,
                    style: AppTypography.bodyM,
                    color: AppColors.textSecondary,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(8),
                  BaseText(
                    l10n.daySproutingLabel(growthDay),
                    style: AppTypography.titleS,
                    color: AppColors.greenDark,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(28),
                  BaseCard(
                    padding: EdgeInsets.zero,
                    borderRadius: 16,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: AppColors.greenBright,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const BaseIcon(
                            Icons.camera_alt,
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
                                BaseText(
                                  l10n.firstQuestUnlockedTitle,
                                  style: AppTypography.titleS,
                                ),
                                const BaseGap.v(2),
                                BaseText(
                                  l10n.firstQuestUnlockedDescription,
                                  style: AppTypography.bodyS,
                                  color: AppColors.textSecondary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const BaseGap.v(28),
                  BaseButton(
                    label: l10n.goToMyGardenButton,
                    trailingIcon: Icons.arrow_forward,
                    isExpanded: true,
                    size: BaseButtonSize.large,
                    onPressed: onGoToGarden,
                  ),
                ],
              ),
            ),
            if (onClose != null)
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  color: AppColors.textMuted,
                  onPressed: onClose,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
