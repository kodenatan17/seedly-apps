import 'package:flutter/material.dart';

import '../../../../../atomic/atomic.dart';
import '../../../../../l10n/l10n.dart';
import '../../models/achievement_ui_model.dart';

/// One row of the medal journey: a rail node + connector on the left and the
/// tier card on the right. Visuals switch on [MedalTierUiModel.status].
class MedalTierTimelineItem extends StatelessWidget {
  const MedalTierTimelineItem({
    super.key,
    required this.tier,
    this.isLast = false,
  });

  final MedalTierUiModel tier;
  final bool isLast;

  static const double _railWidth = 40;
  static const double _railGap = 12;
  static const double _nodeSize = 36;
  static const double _connectorWidth = 3;

  @override
  Widget build(BuildContext context) {
    final railActive =
        tier.status == MedalTierStatus.completed ||
        tier.status == MedalTierStatus.current;

    // The card is the only non-positioned child, so it defines the row height
    // and the rail stretches behind it — no IntrinsicHeight needed (which
    // would also be incompatible with any LayoutBuilder-based descendant).
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: _railWidth + _railGap,
            bottom: isLast ? 0 : 16,
          ),
          child: _TierCard(tier: tier),
        ),
        if (!isLast)
          Positioned(
            left: (_railWidth - _connectorWidth) / 2,
            top: _nodeSize + 4,
            bottom: 4,
            child: Container(
              width: _connectorWidth,
              decoration: BoxDecoration(
                color: railActive
                    ? AppColors.greenBright
                    : AppColors.greenLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            width: _railWidth,
            height: _nodeSize,
            child: Center(child: _TierNode(status: tier.status)),
          ),
        ),
      ],
    );
  }
}

class _TierNode extends StatelessWidget {
  const _TierNode({required this.status});

  final MedalTierStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case MedalTierStatus.completed:
        return const BaseIcon(
          Icons.check,
          size: 16,
          color: AppColors.white,
          backgroundColor: AppColors.greenDark,
          backgroundSize: 32,
        );
      case MedalTierStatus.current:
        return const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: AppShadows.glowGreen,
          ),
          child: BaseIcon(
            Icons.eco,
            size: 18,
            color: AppColors.white,
            backgroundColor: AppColors.greenBright,
            backgroundSize: 36,
            borderColor: AppColors.white,
            borderWidth: 3,
          ),
        );
      case MedalTierStatus.nextTarget:
        return const BaseIcon(
          Icons.lock_outline,
          size: 16,
          color: AppColors.blueDark,
          backgroundColor: AppColors.blueLight,
          backgroundSize: 32,
          borderColor: AppColors.blue,
          borderWidth: 1.5,
        );
      case MedalTierStatus.locked:
        return const BaseIcon(
          Icons.lock_outline,
          size: 16,
          color: AppColors.textMuted,
          backgroundColor: AppColors.lockedSurface,
          backgroundSize: 32,
          borderColor: AppColors.lockedIcon,
          borderWidth: 1.5,
        );
      case MedalTierStatus.legendary:
        return const BaseIcon(
          Icons.workspace_premium,
          size: 18,
          color: AppColors.white,
          backgroundGradient: AppGradients.legendaryBorder,
          backgroundSize: 36,
        );
    }
  }
}

class _TierCard extends StatelessWidget {
  const _TierCard({required this.tier});

  final MedalTierUiModel tier;

  @override
  Widget build(BuildContext context) {
    return switch (tier.status) {
      MedalTierStatus.completed => _CompletedCard(tier: tier),
      MedalTierStatus.current => _CurrentCard(tier: tier),
      MedalTierStatus.nextTarget => _NextTargetCard(tier: tier),
      MedalTierStatus.locked => _LockedCard(tier: tier),
      MedalTierStatus.legendary => _LegendaryCard(tier: tier),
    };
  }
}

class _CompletedCard extends StatelessWidget {
  const _CompletedCard({required this.tier});

  final MedalTierUiModel tier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      padding: EdgeInsets.zero,
      borderRadius: 16,
      // Left accent drawn as a border so the card keeps its natural height
      // inside an unbounded scroll column (no stretch / IntrinsicHeight).
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: AppColors.greenBright, width: 4),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    l10n.tierCompleted(tier.tier),
                    style: AppTypography.labelS,
                    color: AppColors.greenDark,
                    fontWeight: FontWeight.w600,
                  ),
                  const BaseGap.v(4),
                  BaseText(tier.name, style: AppTypography.titleM),
                  const BaseGap.v(6),
                  BaseText(
                    tier.description,
                    style: AppTypography.bodyS,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            const BaseGap.h(8),
            BaseIcon(tier.icon, size: 18, color: AppColors.greenDark),
          ],
        ),
      ),
    );
  }
}

class _CurrentCard extends StatelessWidget {
  const _CurrentCard({required this.tier});

  final MedalTierUiModel tier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      borderRadius: 16,
      borderColor: AppColors.greenDark,
      borderWidth: 2,
      boxShadow: AppShadows.glowGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: BaseIcon(
                        Icons.circle,
                        size: 8,
                        color: AppColors.greenBright,
                      ),
                    ),
                    const BaseGap.h(6),
                    Expanded(
                      child: BaseText(
                        l10n.currentActiveTierLabel,
                        style: AppTypography.overline,
                        color: AppColors.greenDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const BaseGap.h(8),
              BaseBadge(
                label: l10n.rankLabel(tier.tier),
                backgroundColor: AppColors.greenBright,
                foregroundColor: AppColors.greenDarkest,
                textStyle: AppTypography.labelS,
              ),
            ],
          ),
          const BaseGap.v(8),
          BaseText(tier.name, style: AppTypography.headingS),
          const BaseGap.v(6),
          BaseText(
            tier.description,
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
          ),
          const BaseGap.v(14),
          const Divider(height: 1, color: AppColors.greenLight),
          const BaseGap.v(12),
          Row(
            children: [
              Expanded(
                child: BaseText(
                  l10n.milestoneProgressLabel,
                  style: AppTypography.caption,
                  color: AppColors.textSecondary,
                ),
              ),
              BaseText(
                l10n.milestonesFraction(
                  tier.milestoneCurrent,
                  tier.milestoneTarget,
                ),
                style: AppTypography.labelS,
                color: AppColors.greenDark,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const BaseGap.v(8),
          BaseProgressBar(
            value: tier.progress,
            backgroundColor: AppColors.greenLight,
            valueColor: AppColors.greenDark,
          ),
        ],
      ),
    );
  }
}

class _NextTargetCard extends StatelessWidget {
  const _NextTargetCard({required this.tier});

  final MedalTierUiModel tier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      borderRadius: 16,
      backgroundColor: AppColors.blueSurface,
      borderColor: AppColors.blueLight,
      boxShadow: AppShadows.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: BaseText(
                  l10n.nextMilestoneTargetLabel,
                  style: AppTypography.labelS,
                  color: AppColors.blueDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BaseText(
                l10n.progressFraction(
                  tier.milestoneCurrent,
                  tier.milestoneTarget,
                ),
                style: AppTypography.labelS,
                color: AppColors.blueDark,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const BaseGap.v(4),
          BaseText(tier.name, style: AppTypography.titleM),
          const BaseGap.v(6),
          BaseText(
            tier.description,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
          ),
          const BaseGap.v(12),
          BaseProgressBar(
            value: tier.progress,
            height: 6,
            backgroundColor: AppColors.blueLight,
            valueColor: AppColors.blue,
          ),
        ],
      ),
    );
  }
}

class _LockedCard extends StatelessWidget {
  const _LockedCard({required this.tier});

  final MedalTierUiModel tier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      borderRadius: 16,
      backgroundColor: AppColors.lockedSurface,
      borderColor: AppColors.border,
      boxShadow: AppShadows.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            l10n.lockedMilestones(tier.milestoneTarget),
            style: AppTypography.labelS,
            color: AppColors.textMuted,
          ),
          const BaseGap.v(4),
          BaseText(
            tier.name,
            style: AppTypography.titleM,
            color: AppColors.textTertiary,
          ),
          const BaseGap.v(6),
          BaseText(
            tier.description,
            style: AppTypography.bodyS,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

class _LegendaryCard extends StatelessWidget {
  const _LegendaryCard({required this.tier});

  final MedalTierUiModel tier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BaseCard(
      borderRadius: 16,
      borderWidth: 2,
      borderGradient: AppGradients.legendaryBorder,
      gradient: AppGradients.legendaryCard,
      boxShadow: AppShadows.none,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  l10n.legendaryTier(tier.milestoneTarget),
                  style: AppTypography.overline,
                  color: AppColors.greenDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                const BaseGap.v(6),
                BaseText(tier.name, style: AppTypography.headingS),
                const BaseGap.v(6),
                BaseText(
                  tier.description,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          const BaseGap.h(8),
          BaseIcon(tier.icon, size: 20, color: AppColors.gold),
        ],
      ),
    );
  }
}
