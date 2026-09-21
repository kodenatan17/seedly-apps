import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/garden_home/garden_home_entities.dart';

part 'garden_home_response.g.dart';

@JsonSerializable()
class MyLevelResponse implements ResponseMapper<MyLevelEntity> {
  const MyLevelResponse({
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
  final int xpProgress;

  factory MyLevelResponse.fromJson(Map<String, dynamic> json) =>
      _$MyLevelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyLevelResponseToJson(this);

  @override
  MyLevelEntity toDomain() => MyLevelEntity(
    level: level,
    name: name,
    xp: xp,
    nextThreshold: nextThreshold,
    xpProgress: xpProgress,
  );
}

@JsonSerializable()
class MyPlantSummaryResponse implements ResponseMapper<MyPlantSummaryEntity> {
  const MyPlantSummaryResponse({
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
  final String stageStatus;
  final int growthScore;
  final int growthDay;

  factory MyPlantSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPlantSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyPlantSummaryResponseToJson(this);

  @override
  MyPlantSummaryEntity toDomain() => MyPlantSummaryEntity(
    plantId: plantId,
    name: name,
    speciesName: speciesName,
    stageStatus: stageStatus,
    growthScore: growthScore,
    growthDay: growthDay,
  );
}

@JsonSerializable()
class TodayQuestResponse implements ResponseMapper<TodayQuestEntity> {
  const TodayQuestResponse({
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
  final String key;
  final String type;
  final String title;
  final int xpReward;
  final String status;

  factory TodayQuestResponse.fromJson(Map<String, dynamic> json) =>
      _$TodayQuestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodayQuestResponseToJson(this);

  @override
  TodayQuestEntity toDomain() => TodayQuestEntity(
    plantId: plantId,
    questId: questId,
    key: key,
    type: type,
    title: title,
    xpReward: xpReward,
    status: status,
  );
}

@JsonSerializable()
class GardenRewardResponse implements ResponseMapper<GardenRewardEntity> {
  const GardenRewardResponse({
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

  factory GardenRewardResponse.fromJson(Map<String, dynamic> json) =>
      _$GardenRewardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GardenRewardResponseToJson(this);

  @override
  GardenRewardEntity toDomain() => GardenRewardEntity(
    type: type,
    key: key,
    title: title,
    xpReward: xpReward,
    unlockedAt: unlockedAt,
  );
}

@JsonSerializable()
class GardenHomeResponse implements ResponseMapper<GardenHomeEntity> {
  const GardenHomeResponse({
    required this.myLevel,
    this.myPlants = const [],
    this.todaysQuests = const [],
    this.rewards = const [],
  });

  final MyLevelResponse myLevel;
  final List<MyPlantSummaryResponse> myPlants;
  final List<TodayQuestResponse> todaysQuests;
  final List<GardenRewardResponse> rewards;

  factory GardenHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$GardenHomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GardenHomeResponseToJson(this);

  @override
  GardenHomeEntity toDomain() => GardenHomeEntity(
    myLevel: myLevel.toDomain(),
    myPlants: myPlants.map((e) => e.toDomain()).toList(),
    todaysQuests: todaysQuests.map((e) => e.toDomain()).toList(),
    rewards: rewards.map((e) => e.toDomain()).toList(),
  );
}
