// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get backButtonLabel => 'Back';

  @override
  String get closeButtonLabel => 'Close';

  @override
  String progressFraction(int current, int total) {
    return '$current / $total';
  }

  @override
  String milestoneNumber(int number) {
    return 'Milestone $number';
  }

  @override
  String milestonesCount(int count) {
    return '$count Milestones';
  }

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get gardenMasteryTitle => 'Garden Mastery';

  @override
  String levelLabel(int level) {
    return 'Level $level';
  }

  @override
  String levelShort(int level) {
    return 'Lvl $level';
  }

  @override
  String get gardenMasterySubtitle =>
      'Track your growing milestones and earn badges as your digital greenhouse flourishes.';

  @override
  String get currentMedalLabel => 'CURRENT MEDAL';

  @override
  String get masterGardenerName => 'Master Gardener';

  @override
  String get masterGardenerQuote =>
      '\"You\'re becoming a great plant caretaker! Your plants are thriving with steady care.\"';

  @override
  String get milestonesProgressTitle => 'Milestones Progress';

  @override
  String milestonesToNextRank(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count milestones to next rank',
      one: '1 milestone to next rank',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completed';
  }

  @override
  String get nextUnlockLabel => 'NEXT UNLOCK';

  @override
  String get unlockedMedalsTitle => 'Unlocked Medals';

  @override
  String earnedCount(int count) {
    return '$count earned';
  }

  @override
  String get milestoneProgressTitle => 'Milestone Progress';

  @override
  String get medalJourneyLabel => 'Medal Journey';

  @override
  String get medalJourneyDescription =>
      'Grow your rank, unlock rare secrets, and tend your lush digital sanctuary!';

  @override
  String tierValue(int tier) {
    return 'Tier $tier';
  }

  @override
  String get currentRankLabel => 'Current Rank';

  @override
  String get milestonesLabel => 'Milestones';

  @override
  String leftValue(int count) {
    return '$count Left';
  }

  @override
  String get toNextTierLabel => 'To Next Tier';

  @override
  String tierCompleted(int tier) {
    return 'Tier $tier • Completed';
  }

  @override
  String get currentActiveTierLabel => 'CURRENT ACTIVE TIER';

  @override
  String rankLabel(int rank) {
    return 'Rank $rank';
  }

  @override
  String get milestoneProgressLabel => 'Milestone Progress';

  @override
  String milestonesFraction(int current, int total) {
    return '$current / $total Milestones';
  }

  @override
  String get nextMilestoneTargetLabel => 'Next Milestone Target';

  @override
  String lockedMilestones(int count) {
    return 'Locked • $count Milestones';
  }

  @override
  String legendaryTier(int count) {
    return 'LEGENDARY TIER • $count MILESTONES';
  }

  @override
  String get keepRootsGrowingTitle => 'Keep Your Roots Growing!';

  @override
  String keepRootsGrowingDescription(String nextTier) {
    return 'Complete today\'s daily gardening missions to earn rapid milestone points toward $nextTier.';
  }

  @override
  String get viewTodaysMissions => 'View Today\'s Missions';

  @override
  String get tierSeedlingName => 'Seedling';

  @override
  String get tierSeedlingDescription =>
      'Every mighty oak begins as a tiny dream in the dirt. You planted your first root!';

  @override
  String get tierSproutName => 'Sprout';

  @override
  String get tierSproutDescription =>
      'First green leaves breaking the soil! You are learning the rhythm of daily sunshine and water.';

  @override
  String get tierGrowerName => 'Grower';

  @override
  String get tierGrowerDescription =>
      'Stems are thickening and branches reaching out. Consistent care turns tiny sprouts into resilient stalks.';

  @override
  String get tierNurturerName => 'Nurturer';

  @override
  String get tierNurturerDescription =>
      'You know when plants are thirsty before they even ask. Your empathy brings vibrant vitality to the garden.';

  @override
  String get tierGardenerName => 'Gardener';

  @override
  String get tierGardenerDescription =>
      'You manage soil health, pruning schedules, and joyful blossoms with seasoned expertise!';

  @override
  String get tierPlantKeeperName => 'Plant Keeper';

  @override
  String get tierPlantKeeperDescription =>
      'Guard rare botanical species and unlock legendary greenhouse upgrades.';

  @override
  String get plantKeeperUnlockDescription =>
      'Unlock exotic seeds and fertilizer boosts!';

  @override
  String get tierGardenKeeperName => 'Garden Keeper';

  @override
  String get tierGardenKeeperDescription =>
      'Master complex companion planting and balance seasonal microclimates.';

  @override
  String get tierGardenMasterName => 'Garden Master';

  @override
  String get tierGardenMasterDescription =>
      'Design breathtaking ecosystem landscapes that hum with pollinator wildlife.';

  @override
  String get tierGreenThumbName => 'Green Thumb';

  @override
  String get tierGreenThumbDescription =>
      'A legendary touch where even dormant seeds spring instantly to joyful life.';

  @override
  String get tierBloomMasterName => 'Bloom Master';

  @override
  String get tierBloomMasterDescription =>
      'The ultimate pinnacle of sanctuary cultivation. Your sanctuary becomes a timeless wonderland of eternal spring!';

  @override
  String get newAchievementsTitle => 'New Achievements';

  @override
  String get achievementUnlockedBadge => 'Achievement Unlocked';

  @override
  String get newMedalUnlockedTitle => '🎉 New Medal Unlocked!';

  @override
  String get plantKeeperSupremeName => 'Plant Keeper Supreme';

  @override
  String unlockedMedalMessage(String petName) {
    return 'Amazing work! $petName and your digital garden are flourishing.';
  }

  @override
  String get milestonesCompletedLabel => 'Milestones completed';

  @override
  String get unlockedPerkLabel => 'Unlocked Perk';

  @override
  String get goldenPotPerk => 'Special Golden Pot Skin & +100 XP Bonus!';

  @override
  String get claimRewardAndContinue => 'Claim Reward & Continue';

  @override
  String get viewInMedalJourney => 'View in Medal Journey';
}
