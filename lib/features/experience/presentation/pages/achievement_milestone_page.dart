import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../models/achievement_dummy_data.dart';
import '../models/achievement_ui_model.dart';
import '../widgets/achievement/medal_journey_header_card.dart';
import '../widgets/achievement/medal_tier_timeline_item.dart';
import '../widgets/achievement/milestone_cta_card.dart';

/// "Milestone Progress / Medal Journey" screen — vertical tier timeline.
///
/// Route entry point — exported by `public_api.dart`. Navigation is injected
/// through callbacks. When [journey] is omitted the page renders
/// [AchievementDummyData].
class AchievementMilestonePage extends StatelessWidget {
  const AchievementMilestonePage({
    super.key,
    this.journey,
    this.onBack,
    this.onClose,
    this.onViewMissions,
  });

  final MedalJourneyUiModel? journey;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final VoidCallback? onViewMissions;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final data = journey ?? AchievementDummyData.journey(l10n);
    final tiers = data.tiers;

    return Scaffold(
      appBar: BaseAppBar(
        title: l10n.milestoneProgressTitle,
        onBack: onBack,
        onClose: onClose,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MedalJourneyHeaderCard(journey: data),
              const BaseGap.v(24),
              for (var i = 0; i < tiers.length; i++)
                MedalTierTimelineItem(
                  tier: tiers[i],
                  isLast: i == tiers.length - 1,
                ),
              const BaseGap.v(24),
              MilestoneCtaCard(
                nextTierName: data.nextTarget.name,
                onViewMissions: onViewMissions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
