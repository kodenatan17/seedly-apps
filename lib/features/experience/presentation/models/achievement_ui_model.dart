import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// Presentation-only models for the Achievement / Medal Journey screens.
///
/// These are deliberately decoupled from domain entities: the mastery-tier
/// API is not wired yet, so pages render from [AchievementDummyData] until a
/// mapper from the domain layer replaces it.
enum MedalTierStatus { completed, current, nextTarget, locked, legendary }

class MedalTierUiModel extends Equatable {
  const MedalTierUiModel({
    required this.tier,
    required this.name,
    required this.description,
    required this.milestoneTarget,
    required this.milestoneCurrent,
    required this.status,
    required this.icon,
  });

  final int tier;
  final String name;
  final String description;
  final int milestoneTarget;
  final int milestoneCurrent;
  final MedalTierStatus status;
  final IconData icon;

  double get progress => milestoneTarget == 0
      ? 0
      : (milestoneCurrent / milestoneTarget).clamp(0.0, 1.0).toDouble();

  @override
  List<Object?> get props => [
    tier,
    name,
    description,
    milestoneTarget,
    milestoneCurrent,
    status,
    icon,
  ];
}

class UnlockedMedalUiModel extends Equatable {
  const UnlockedMedalUiModel({
    required this.name,
    required this.milestone,
    required this.icon,
  });

  final String name;
  final int milestone;
  final IconData icon;

  @override
  List<Object?> get props => [name, milestone, icon];
}

class AchievementSummaryUiModel extends Equatable {
  const AchievementSummaryUiModel({
    required this.level,
    required this.currentMedalName,
    required this.quote,
    required this.milestonesCurrent,
    required this.milestonesTotal,
    required this.nextUnlockName,
    required this.nextUnlockDescription,
    required this.nextUnlockMilestones,
    required this.unlockedMedals,
  });

  final int level;
  final String currentMedalName;
  final String quote;
  final int milestonesCurrent;
  final int milestonesTotal;
  final String nextUnlockName;
  final String nextUnlockDescription;
  final int nextUnlockMilestones;
  final List<UnlockedMedalUiModel> unlockedMedals;

  int get remaining => (milestonesTotal - milestonesCurrent).clamp(0, 1 << 31);

  int get percent => milestonesTotal == 0
      ? 0
      : (milestonesCurrent * 100 / milestonesTotal).round().clamp(0, 100);

  double get progress => milestonesTotal == 0
      ? 0
      : (milestonesCurrent / milestonesTotal).clamp(0.0, 1.0).toDouble();

  @override
  List<Object?> get props => [
    level,
    currentMedalName,
    quote,
    milestonesCurrent,
    milestonesTotal,
    nextUnlockName,
    nextUnlockDescription,
    nextUnlockMilestones,
    unlockedMedals,
  ];
}

class MedalJourneyUiModel extends Equatable {
  const MedalJourneyUiModel({
    required this.currentTier,
    required this.milestonesCurrent,
    required this.milestonesTotal,
    required this.leftToNextTier,
    required this.tiers,
  });

  final int currentTier;
  final int milestonesCurrent;
  final int milestonesTotal;
  final int leftToNextTier;
  final List<MedalTierUiModel> tiers;

  /// The tier flagged as the next target, falling back to the first locked
  /// tier, then the last tier, so callers never get null.
  MedalTierUiModel get nextTarget {
    for (final tier in tiers) {
      if (tier.status == MedalTierStatus.nextTarget) return tier;
    }
    for (final tier in tiers) {
      if (tier.status == MedalTierStatus.locked) return tier;
    }
    return tiers.last;
  }

  @override
  List<Object?> get props => [
    currentTier,
    milestonesCurrent,
    milestonesTotal,
    leftToNextTier,
    tiers,
  ];
}

class UnlockedAchievementUiModel extends Equatable {
  const UnlockedAchievementUiModel({
    required this.medalName,
    required this.petName,
    required this.milestonesCurrent,
    required this.milestonesTotal,
    required this.perkDescription,
  });

  final String medalName;
  final String petName;
  final int milestonesCurrent;
  final int milestonesTotal;
  final String perkDescription;

  double get progress => milestonesTotal == 0
      ? 0
      : (milestonesCurrent / milestonesTotal).clamp(0.0, 1.0).toDouble();

  @override
  List<Object?> get props => [
    medalName,
    petName,
    milestonesCurrent,
    milestonesTotal,
    perkDescription,
  ];
}
