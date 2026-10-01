import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// "Learn, Earn & Flourish" onboarding screen — route entry point, exported by
/// `public_api.dart`.
///
/// Only the final frame of the 4-step flow exists in the mockups, so this
/// renders that one slide with the dot indicator derived from
/// [step]/[totalSteps]. ponytail: no `PageView`/swipe yet — add the slide
/// data + pager once the step 1-3 copy lands.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    this.step = 4,
    this.totalSteps = 4,
    this.medalProgress = 1,
    this.medalTotal = 10,
    this.onGetStarted,
    this.onLogIn,
  });

  final int step;
  final int totalSteps;

  /// Medal-journey progress shown in the second card.
  final int medalProgress;
  final int medalTotal;
  final VoidCallback? onGetStarted;
  final VoidCallback? onLogIn;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Column(
            children: [
              Row(
                children: [
                  const BaseIcon(
                    Icons.spa,
                    size: 18,
                    color: AppColors.greenDark,
                    backgroundColor: AppColors.greenLight,
                    backgroundSize: 36,
                  ),
                  const BaseGap.h(10),
                  BaseText(
                    'SEEDLY',
                    style: AppTypography.headingS,
                    color: AppColors.greenDark,
                    letterSpacing: 2,
                  ),
                  const Spacer(),
                  BaseBadge(
                    icon: Icons.verified,
                    iconSize: 12,
                    label: l10n.authStepProgress(step, totalSteps),
                    backgroundColor: AppColors.greenLight,
                    foregroundColor: AppColors.greenDark,
                  ),
                ],
              ),
              const BaseGap.v(20),
              _MedalHero(badgeLabel: l10n.authGardenMasterBadge),
              const BaseGap.v(24),
              BaseText(
                l10n.authOnboardingHeroTitle,
                style: AppTypography.headingL,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(8),
              BaseText(
                l10n.authOnboardingHeroDescription,
                style: AppTypography.bodyM,
                color: AppColors.textSecondary,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(24),
              _OnboardingFeatureCard(
                icon: Icons.psychology_alt_outlined,
                iconBackgroundColor: AppColors.greenLight,
                iconColor: AppColors.greenDark,
                title: l10n.authBotanyQuickChecksTitle,
                description: l10n.authBotanyQuickChecksDescription,
                trailing: BaseBadge(
                  label: l10n.authXpBadge,
                  backgroundColor: AppColors.greenLight,
                  foregroundColor: AppColors.greenDark,
                ),
              ),
              const BaseGap.v(12),
              _OnboardingFeatureCard(
                icon: Icons.emoji_events_outlined,
                iconBackgroundColor: AppColors.yellow,
                iconColor: AppColors.yellowText,
                title: l10n.authMedalJourneyTitle,
                description: l10n.authMedalJourneySubtitle,
                trailing: BaseText(
                  l10n.authMedalJourneyFraction(medalProgress, medalTotal),
                  style: AppTypography.labelS,
                  color: AppColors.textSecondary,
                ),
                progress: medalTotal == 0 ? 0 : medalProgress / medalTotal,
              ),
              const BaseGap.v(12),
              _OnboardingFeatureCard(
                icon: Icons.smart_toy_outlined,
                iconBackgroundColor: AppColors.blueLight,
                iconColor: AppColors.blueDark,
                title: l10n.authPlantCompanionTitle,
                description: l10n.authPlantCompanionDescription,
                trailing: const BaseIcon(
                  Icons.chat_bubble_outline,
                  size: 16,
                  color: AppColors.blueDark,
                  backgroundColor: AppColors.blueLight,
                  backgroundSize: 34,
                ),
              ),
              const BaseGap.v(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var index = 0; index < totalSteps; index++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: index == step - 1 ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == step - 1
                            ? AppColors.greenDark
                            : AppColors.lavender,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                ],
              ),
              const BaseGap.v(20),
              BaseButton(
                label: l10n.authGetStartedButton,
                trailingIcon: Icons.arrow_forward,
                size: BaseButtonSize.large,
                isExpanded: true,
                borderRadius: BorderRadius.circular(999),
                onPressed: onGetStarted,
              ),
              const BaseGap.v(8),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  BaseText(
                    l10n.authAlreadyHaveAccount,
                    style: AppTypography.bodyS,
                    color: AppColors.textSecondary,
                  ),
                  BaseTextLink(l10n.authLogInLink, onTap: onLogIn),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Medal cover: glowing card with the tier badge tucked under the medallion.
class _MedalHero extends StatelessWidget {
  const _MedalHero({required this.badgeLabel});

  final String badgeLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: BaseCard(
              gradient: AppGradients.legendaryCard,
              borderRadius: 24,
              boxShadow: AppShadows.none,
              padding: EdgeInsets.zero,
              child: const SizedBox.expand(),
            ),
          ),
          const BaseIcon(
            Icons.emoji_events,
            size: 40,
            color: AppColors.yellowText,
            backgroundColor: AppColors.white,
            backgroundSize: 88,
          ),
          Positioned(
            bottom: 8,
            child: BaseBadge(
              icon: Icons.star,
              iconSize: 12,
              label: badgeLabel,
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.yellowText,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            ),
          ),
        ],
      ),
    );
  }
}

/// Feature row: tinted icon, title + description, and a trailing badge,
/// counter or glyph. [progress] adds the medal-journey bar underneath.
class _OnboardingFeatureCard extends StatelessWidget {
  const _OnboardingFeatureCard({
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.title,
    required this.description,
    this.trailing,
    this.progress,
  });

  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String title;
  final String description;
  final Widget? trailing;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              BaseIcon(
                icon,
                size: 22,
                color: iconColor,
                backgroundColor: iconBackgroundColor,
                backgroundSize: 44,
              ),
              const BaseGap.h(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(title, style: AppTypography.titleS),
                    const BaseGap.v(2),
                    BaseText(
                      description,
                      style: AppTypography.bodyS,
                      color: AppColors.textSecondary,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (trailing != null) ...[const BaseGap.h(8), trailing!],
            ],
          ),
          if (progress != null) ...[
            const BaseGap.v(12),
            BaseProgressBar(value: progress!, height: 6),
          ],
        ],
      ),
    );
  }
}

