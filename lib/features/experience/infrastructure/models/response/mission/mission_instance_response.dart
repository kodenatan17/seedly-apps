import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_instance_entities.dart';

part 'mission_instance_response.g.dart';

@JsonSerializable()
class MissionInstanceResponse
    implements ResponseMapper<MissionInstanceEntity> {
  final String id;
  final MissionDefinitionResponse definition;
  final MissionScopeRefResponse scope;
  final String status;
  final DateTime activatedAt;
  final DateTime? completedAt;

  /// Empty on the history list response (spec §14 keeps it compact).
  final List<MissionObjectiveResponse> objectives;
  final MissionProgressResponse progress;

  /// Present only on completed instances from `/history`.
  final XpGrantResponse? xpGranted;

  const MissionInstanceResponse({
    required this.id,
    required this.definition,
    required this.scope,
    required this.status,
    required this.activatedAt,
    this.completedAt,
    this.objectives = const [],
    this.progress = const MissionProgressResponse(
      objectivesCompleted: 0,
      objectivesTotal: 0,
    ),
    this.xpGranted,
  });

  factory MissionInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionInstanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionInstanceResponseToJson(this);

  @override
  MissionInstanceEntity toDomain() {
    return MissionInstanceEntity(
      id: id,
      definition: definition.toDomain(),
      scope: scope.toDomain(),
      status: status,
      activatedAt: activatedAt,
      completedAt: completedAt,
      objectives: objectives.map((e) => e.toDomain()).toList(),
      progress: progress.toDomain(),
      xpGranted: xpGranted?.toDomain(),
    );
  }
}

@JsonSerializable()
class MissionObjectiveResponse implements ResponseMapper<MissionObjective> {
  final String key;
  final String title;
  final String sourceType;
  final int countRequired;
  final int evidencedCount;
  final String status;

  const MissionObjectiveResponse({
    required this.key,
    required this.title,
    required this.sourceType,
    required this.countRequired,
    required this.evidencedCount,
    required this.status,
  });

  factory MissionObjectiveResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionObjectiveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionObjectiveResponseToJson(this);

  @override
  MissionObjective toDomain() {
    return MissionObjective(
      key: key,
      title: title,
      sourceType: sourceType,
      countRequired: countRequired,
      evidencedCount: evidencedCount,
      status: status,
    );
  }
}

@JsonSerializable()
class MissionDefinitionResponse implements ResponseMapper<MissionDefinition> {
  final String key;
  final String title;
  final String? subtitle;
  final int xpReward;

  const MissionDefinitionResponse({
    required this.key,
    required this.title,
    this.subtitle,
    required this.xpReward,
  });

  factory MissionDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionDefinitionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionDefinitionResponseToJson(this);

  @override
  MissionDefinition toDomain() {
    return MissionDefinition(
      key: key,
      title: title,
      subtitle: subtitle,
      xpReward: xpReward,
    );
  }
}

@JsonSerializable()
class MissionScopeRefResponse implements ResponseMapper<MissionScopeRef> {
  final String? type;
  final String? plantId;
  final String? containerId;

  MissionScopeRefResponse({this.type, this.plantId, this.containerId});

  factory MissionScopeRefResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionScopeRefResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionScopeRefResponseToJson(this);

  @override
  MissionScopeRef toDomain() {
    return MissionScopeRef(
      type: type,
      plantId: plantId,
      containerId: containerId,
    );
  }
}

@JsonSerializable()
class MissionProgressResponse implements ResponseMapper<MissionProgress> {
  final int objectivesCompleted;
  final int objectivesTotal;

  const MissionProgressResponse({
    required this.objectivesCompleted,
    required this.objectivesTotal,
  });

  factory MissionProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionProgressResponseToJson(this);

  MissionProgress toDomain() {
    return MissionProgress(
      objectivesCompleted: objectivesCompleted,
      objectivesTotal: objectivesTotal,
    );
  }
}

@JsonSerializable()
class XpGrantResponse implements ResponseMapper<XpGrant> {
  final int amount;
  final String xpEventId;

  const XpGrantResponse({required this.amount, required this.xpEventId});

  factory XpGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$XpGrantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$XpGrantResponseToJson(this);

  @override
  XpGrant toDomain() {
    return XpGrant(amount: amount, xpEventId: xpEventId);
  }
}
