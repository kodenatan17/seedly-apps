import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_history_entities.dart';

part 'quest_history_response.g.dart';

@JsonSerializable()
class QuestHistoryResponse implements ResponseMapper<QuestHistoryEntity> {
  final String questId;
  final String key;
  final String type;
  final String status;
  final DateTime completedAt;
  final int xpAwarded;

  const QuestHistoryResponse({
    required this.questId,
    required this.key,
    required this.type,
    required this.status,
    required this.completedAt,
    required this.xpAwarded,
  });

  factory QuestHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestHistoryResponseToJson(this);

  @override
  QuestHistoryEntity toDomain() => QuestHistoryEntity(
    questId: questId,
    key: key,
    type: type,
    status: status,
    completedAt: completedAt,
    xpAwarded: xpAwarded,
  );
}
