import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../models/achievement_dummy_data.dart';
import '../models/achievement_ui_model.dart';
import '../widgets/achievement/unlocked_medal_hero.dart';
import '../widgets/achievement/unlocked_perk_row.dart';

/// "New Medal Unlocked" celebration screen.
///
/// Route entry point — exported by `public_api.dart`. Navigation is injected
/// through callbacks. When [model] is omitted the page renders
/// [AchievementDummyData].
class AchievementUnlockedPage extends StatelessWidget {
  const AchievementUnlockedPage({
    super.key,
    this.model,
    this.onClose,
    this.onClaimReward,
    this.onViewJourney,
  });

  final UnlockedAchievementUiModel? model;
  final VoidCallback? onClose;
  final VoidCallback? onClaimReward;
  final VoidCallback? onViewJourney;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final data = model ?? AchievementDummyData.unlocked(l10n);

    return Scaffold(
      appBar: BaseAppBar(
        title: l10n.newAchievementsTitle,
        showBack: false,
        centerTitle: false,
        titleStyle: AppTypography.headingM,
        onClose: onClose,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: BaseCard(
            gradient: AppGradients.unlockedGlow,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            borderRadius: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UnlockedMedalHero(model: data),
                const BaseGap.v(24),
                BaseCard(
                  backgroundColor: AppColors.greenPale,
                  boxShadow: AppShadows.none,
                  borderRadius: 16,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: BaseText(
                              l10n.milestonesCompletedLabel,
                              style: AppTypography.titleS,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          BaseText(
                            l10n.progressFraction(
                              data.milestonesCurrent,
                              data.milestonesTotal,
                            ),
                            style: AppTypography.titleS,
                            color: AppColors.greenDarkest,
                          ),
                        ],
                      ),
                      const BaseGap.v(12),
                      BaseProgressBar(
                        value: data.progress,
                        height: 10,
                        backgroundColor: AppColors.greenLight,
                        valueColor: AppColors.greenDark,
                      ),
                      const BaseGap.v(12),
                      UnlockedPerkRow(perk: data.perkDescription),
                    ],
                  ),
                ),
                const BaseGap.v(20),
                BaseButton(
                  label: l10n.claimRewardAndContinue,
                  onPressed: onClaimReward,
                  leadingIcon: Icons.redeem,
                  size: BaseButtonSize.large,
                  isExpanded: true,
                ),
                const BaseGap.v(12),
                BaseButton(
                  label: l10n.viewInMedalJourney,
                  onPressed: onViewJourney,
                  variant: BaseButtonVariant.secondary,
                  leadingIcon: Icons.military_tech,
                  size: BaseButtonSize.large,
                  isExpanded: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
