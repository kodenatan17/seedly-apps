import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_history_entities.dart';

part 'mission_history_response.g.dart';

@JsonSerializable()
class MissionHistoryResponse implements ResponseMapper<MissionHistoryEntity> {
  final String id;
  final DefinitionHistoryResponse definition;
  final ScopeHistoryResponse scope;
  final String plantId;
  final String status;
  final String activedAt;
  final String? completedAt;
  final XpGrantHistoryResponse xpGranted;

  const MissionHistoryResponse({
    required this.id,
    required this.definition,
    required this.scope,
    required this.plantId,
    required this.status,
    required this.activedAt,
    this.completedAt,
    required this.xpGranted,
  });

  factory MissionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionHistoryResponseToJson(this);

  @override
  MissionHistoryEntity toDomain() {
    return MissionHistoryEntity(
      id: id,
      definition: definition.toDomain(),
      scope: scope.toDomain(),
      plantId: plantId,
      status: status,
      activedAt: activedAt,
      completedAt: completedAt,
      xpGranted: xpGranted.toDomain(),
    );
  }
}

@JsonSerializable()
class DefinitionHistoryResponse
    implements ResponseMapper<DefinitionHistoryEntity> {
  final String key;
  final String title;
  final int xpReward;

  const DefinitionHistoryResponse({
    required this.key,
    required this.title,
    required this.xpReward,
  });

  factory DefinitionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DefinitionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionHistoryResponseToJson(this);

  @override
  DefinitionHistoryEntity toDomain() {
    return DefinitionHistoryEntity(
      key: key,
      title: title,
      xpReward: xpReward,
    );
  }
}

@JsonSerializable()
class ScopeHistoryResponse implements ResponseMapper<ScopeHistoryEntity> {
  final String type;
  final String? plantId;

  const ScopeHistoryResponse({required this.type, this.plantId});

  factory ScopeHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ScopeHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScopeHistoryResponseToJson(this);

  @override
  ScopeHistoryEntity toDomain() {
    return ScopeHistoryEntity(type: type, plantId: plantId);
  }
}

@JsonSerializable()
class XpGrantHistoryResponse implements ResponseMapper<XpGrantHistoryEntity> {
  final String id;
  final int amount;
  final String grantedAt;

  const XpGrantHistoryResponse({
    required this.id,
    required this.amount,
    required this.grantedAt,
  });

  factory XpGrantHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$XpGrantHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$XpGrantHistoryResponseToJson(this);

  @override
  XpGrantHistoryEntity toDomain() {
    return XpGrantHistoryEntity(id: id, amount: amount, grantedAt: grantedAt);
  }
}
