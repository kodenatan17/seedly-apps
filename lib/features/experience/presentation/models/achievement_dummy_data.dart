import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import 'achievement_ui_model.dart';

/// Static presentation-only data mirroring the design mockups.
///
/// Replace with a mapper from domain entities once the mastery / medal API
/// (`GET /v1/me/mastery`, `GET /v1/me/mastery/tiers`) is wired into the
/// feature. Copy is resolved through [AppLocalizations] so nothing here is a
/// hardcoded user-facing string.
abstract final class AchievementDummyData {
  static AchievementSummaryUiModel summary(AppLocalizations l10n) {
    return AchievementSummaryUiModel(
      level: 5,
      currentMedalName: l10n.masterGardenerName,
      quote: l10n.masterGardenerQuote,
      milestonesCurrent: 28,
      milestonesTotal: 35,
      nextUnlockName: l10n.tierPlantKeeperName,
      nextUnlockDescription: l10n.plantKeeperUnlockDescription,
      nextUnlockMilestones: 35,
      unlockedMedals: [
        UnlockedMedalUiModel(
          name: l10n.tierSeedlingName,
          milestone: 1,
          icon: Icons.eco,
        ),
        UnlockedMedalUiModel(
          name: l10n.tierSproutName,
          milestone: 5,
          icon: Icons.grass,
        ),
        UnlockedMedalUiModel(
          name: l10n.tierGrowerName,
          milestone: 12,
          icon: Icons.local_florist,
        ),
        UnlockedMedalUiModel(
          name: l10n.tierNurturerName,
          milestone: 20,
          icon: Icons.spa,
        ),
      ],
    );
  }

  static MedalJourneyUiModel journey(AppLocalizations l10n) {
    return MedalJourneyUiModel(
      currentTier: 5,
      milestonesCurrent: 38,
      milestonesTotal: 45,
      leftToNextTier: 5,
      tiers: [
        MedalTierUiModel(
          tier: 1,
          name: l10n.tierSeedlingName,
          description: l10n.tierSeedlingDescription,
          milestoneTarget: 1,
          milestoneCurrent: 1,
          status: MedalTierStatus.completed,
          icon: Icons.eco,
        ),
        MedalTierUiModel(
          tier: 2,
          name: l10n.tierSproutName,
          description: l10n.tierSproutDescription,
          milestoneTarget: 5,
          milestoneCurrent: 5,
          status: MedalTierStatus.completed,
          icon: Icons.grass,
        ),
        MedalTierUiModel(
          tier: 3,
          name: l10n.tierGrowerName,
          description: l10n.tierGrowerDescription,
          milestoneTarget: 12,
          milestoneCurrent: 12,
          status: MedalTierStatus.completed,
          icon: Icons.local_florist,
        ),
        MedalTierUiModel(
          tier: 4,
          name: l10n.tierNurturerName,
          description: l10n.tierNurturerDescription,
          milestoneTarget: 20,
          milestoneCurrent: 20,
          status: MedalTierStatus.completed,
          icon: Icons.spa,
        ),
        MedalTierUiModel(
          tier: 5,
          name: l10n.tierGardenerName,
          description: l10n.tierGardenerDescription,
          milestoneTarget: 40,
          milestoneCurrent: 38,
          status: MedalTierStatus.current,
          icon: Icons.yard,
        ),
        MedalTierUiModel(
          tier: 6,
          name: l10n.tierPlantKeeperName,
          description: l10n.tierPlantKeeperDescription,
          milestoneTarget: 45,
          milestoneCurrent: 38,
          status: MedalTierStatus.nextTarget,
          icon: Icons.park,
        ),
        MedalTierUiModel(
          tier: 7,
          name: l10n.tierGardenKeeperName,
          description: l10n.tierGardenKeeperDescription,
          milestoneTarget: 45,
          milestoneCurrent: 0,
          status: MedalTierStatus.locked,
          icon: Icons.forest,
        ),
        MedalTierUiModel(
          tier: 8,
          name: l10n.tierGardenMasterName,
          description: l10n.tierGardenMasterDescription,
          milestoneTarget: 60,
          milestoneCurrent: 0,
          status: MedalTierStatus.locked,
          icon: Icons.emoji_events,
        ),
        MedalTierUiModel(
          tier: 9,
          name: l10n.tierGreenThumbName,
          description: l10n.tierGreenThumbDescription,
          milestoneTarget: 80,
          milestoneCurrent: 0,
          status: MedalTierStatus.locked,
          icon: Icons.thumb_up,
        ),
        MedalTierUiModel(
          tier: 10,
          name: l10n.tierBloomMasterName,
          description: l10n.tierBloomMasterDescription,
          milestoneTarget: 100,
          milestoneCurrent: 0,
          status: MedalTierStatus.legendary,
          icon: Icons.star,
        ),
      ],
    );
  }

  static UnlockedAchievementUiModel unlocked(AppLocalizations l10n) {
    return UnlockedAchievementUiModel(
      medalName: l10n.plantKeeperSupremeName,
      petName: 'Tommy',
      milestonesCurrent: 35,
      milestonesTotal: 35,
      perkDescription: l10n.goldenPotPerk,
    );
  }
}
