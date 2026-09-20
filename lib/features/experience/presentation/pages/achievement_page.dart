import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../models/achievement_dummy_data.dart';
import '../models/achievement_ui_model.dart';
import '../widgets/achievement/achievement_header.dart';
import '../widgets/achievement/current_medal_card.dart';
import '../widgets/achievement/next_unlock_card.dart';
import '../widgets/achievement/unlocked_medal_tile.dart';

/// "Achievements / Garden Mastery" screen.
///
/// Route entry point — exported by `public_api.dart`. Navigation is injected
/// through callbacks so the page never imports `go_router`. When [summary] is
/// omitted the page renders [AchievementDummyData] (UI slicing stage; the
/// mastery API is not wired yet).
class AchievementPage extends StatelessWidget {
  const AchievementPage({
    super.key,
    this.summary,
    this.onBack,
    this.onClose,
    this.onOpenMilestones,
    this.onCurrentMedalTap,
  });

  final AchievementSummaryUiModel? summary;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final VoidCallback? onOpenMilestones;
  final VoidCallback? onCurrentMedalTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final data = summary ?? AchievementDummyData.summary(l10n);

    return Scaffold(
      appBar: BaseAppBar(
        title: l10n.achievementsTitle,
        onBack: onBack,
        onClose: onClose,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AchievementHeader(
                level: data.level,
                subtitle: l10n.gardenMasterySubtitle,
              ),
              const BaseGap.v(20),
              CurrentMedalCard(summary: data, onTap: onCurrentMedalTap),
              const BaseGap.v(16),
              NextUnlockCard(
                name: data.nextUnlockName,
                description: data.nextUnlockDescription,
                milestones: data.nextUnlockMilestones,
                onTap: onOpenMilestones,
              ),
              const BaseGap.v(24),
              Row(
                children: [
                  Expanded(
                    child: BaseText(
                      l10n.unlockedMedalsTitle,
                      style: AppTypography.headingS,
                    ),
                  ),
                  BaseText(
                    l10n.earnedCount(data.unlockedMedals.length),
                    style: AppTypography.labelM,
                    color: AppColors.greenDark,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              const BaseGap.v(12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: data.unlockedMedals.length,
                itemBuilder: (context, index) =>
                    UnlockedMedalTile(medal: data.unlockedMedals[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
