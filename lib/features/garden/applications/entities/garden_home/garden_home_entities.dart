import 'package:equatable/equatable.dart';

/// Level/XP summary embedded in the Garden Home dashboard.
class MyLevelEntity extends Equatable {
  const MyLevelEntity({
    required this.level,
    required this.name,
    required this.xp,
    required this.nextThreshold,
    required this.xpProgress,
  });

  final int level;
  final String name;
  final int xp;
  final int nextThreshold;

  /// Percent progress (0–100) toward [nextThreshold].
  final int xpProgress;

  @override
  List<Object?> get props => [level, name, xp, nextThreshold, xpProgress];
}

/// One plant's dashboard summary card.
class MyPlantSummaryEntity extends Equatable {
  const MyPlantSummaryEntity({
    required this.plantId,
    required this.name,
    required this.speciesName,
    required this.stageStatus,
    required this.growthScore,
    required this.growthDay,
  });

  final String plantId;
  final String name;
  final String speciesName;

  /// 8-state status computed read-time from growth journeys/reports, e.g.
  /// `ON_TRACK`.
  final String stageStatus;
  final int growthScore;
  final int growthDay;

  @override
  List<Object?> get props => [
    plantId,
    name,
    speciesName,
    stageStatus,
    growthScore,
    growthDay,
  ];
}

/// One of today's pending quests, surfaced on the dashboard.
class TodayQuestEntity extends Equatable {
  const TodayQuestEntity({
    required this.plantId,
    required this.questId,
    required this.key,
    required this.type,
    required this.title,
    required this.xpReward,
    required this.status,
  });

  final String plantId;
  final String questId;

  /// Stable machine id, e.g. `water_the_plant`.
  final String key;

  /// e.g. `WATERING`.
  final String type;
  final String title;
  final int xpReward;

  /// e.g. `PENDING`.
  final String status;

  @override
  List<Object?> get props => [
    plantId,
    questId,
    key,
    type,
    title,
    xpReward,
    status,
  ];
}

/// A recently-unlocked reward surfaced on the dashboard.
///
/// `type` is only confirmed as `ACHIEVEMENT` in the spec; `LEVEL_UP` is
/// mentioned as a possible other source but has no documented field shape
/// (contract §2.3.8 note) — treat any other `type` value defensively.
class GardenRewardEntity extends Equatable {
  const GardenRewardEntity({
    required this.type,
    required this.key,
    required this.title,
    required this.xpReward,
    required this.unlockedAt,
  });

  final String type;
  final String key;
  final String title;
  final int xpReward;
  final DateTime unlockedAt;

  @override
  List<Object?> get props => [type, key, title, xpReward, unlockedAt];
}

/// Garden Home dashboard aggregate (`GET /v1/garden/home`, contract §2.3.8).
class GardenHomeEntity extends Equatable {
  const GardenHomeEntity({
    required this.myLevel,
    this.myPlants = const [],
    this.todaysQuests = const [],
    this.rewards = const [],
  });

  final MyLevelEntity myLevel;
  final List<MyPlantSummaryEntity> myPlants;
  final List<TodayQuestEntity> todaysQuests;
  final List<GardenRewardEntity> rewards;

  @override
  List<Object?> get props => [myLevel, myPlants, todaysQuests, rewards];
}
