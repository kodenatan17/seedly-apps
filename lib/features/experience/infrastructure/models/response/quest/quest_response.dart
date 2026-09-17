import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_entities.dart';

part 'quest_response.g.dart';

@JsonSerializable()
class QuestResponse implements ResponseMapper<QuestEntity> {
  final String questId;
  final String key;
  final String type;
  final String title;
  final String verification;
  final int xpReward;
  final int progress;
  final int requiredCount;
  final String status;

  const QuestResponse({
    required this.questId,
    required this.key,
    required this.type,
    required this.title,
    required this.verification,
    required this.xpReward,
    required this.progress,
    required this.requiredCount,
    required this.status,
  });

  factory QuestResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestResponseToJson(this);

  @override
  QuestEntity toDomain() => QuestEntity(
    questId: questId,
    key: key,
    type: type,
    title: title,
    verification: verification,
    xpReward: xpReward,
    progress: progress,
    requiredCount: requiredCount,
    status: status,
  );
}

@JsonSerializable()
class QuestSubmitResponse implements ResponseMapper<QuestSubmitResultEntity> {
  final String questId;
  final String status;
  final int xpAwarded;

  const QuestSubmitResponse({
    required this.questId,
    required this.status,
    required this.xpAwarded,
  });

  factory QuestSubmitResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestSubmitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestSubmitResponseToJson(this);

  @override
  QuestSubmitResultEntity toDomain() => QuestSubmitResultEntity(
    questId: questId,
    status: status,
    xpAwarded: xpAwarded,
  );
}
