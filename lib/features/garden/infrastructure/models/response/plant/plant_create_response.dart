import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/plant/plant_entities.dart';

part 'plant_create_response.g.dart';

/// The API returns `health_score` (snake_case), inconsistent with the global
/// camelCase convention (api_contracts_backend.md §2 note) — preserved
/// literally via [JsonKey] rather than "fixed" client-side.
@JsonSerializable()
class PlantCreateResponse implements ResponseMapper<PlantCreateResultEntity> {
  const PlantCreateResponse({
    required this.id,
    required this.status,
    required this.healthScore,
    required this.containerId,
  });

  final String id;
  final String status;

  @JsonKey(name: 'health_score')
  final int healthScore;
  final String containerId;

  factory PlantCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$PlantCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlantCreateResponseToJson(this);

  @override
  PlantCreateResultEntity toDomain() => PlantCreateResultEntity(
    id: id,
    status: status,
    healthScore: healthScore,
    containerId: containerId,
  );
}
