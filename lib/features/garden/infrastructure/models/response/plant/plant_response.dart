import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/plant/plant_entities.dart';

part 'plant_response.g.dart';

@JsonSerializable()
class PlantResponse implements ResponseMapper<PlantEntity> {
  const PlantResponse({
    required this.id,
    required this.name,
    required this.stage,
    required this.score,
    required this.plantedAt,
    required this.speciesId,
    required this.containerId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String stage;
  final int score;
  final DateTime plantedAt;
  final String speciesId;
  final String containerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory PlantResponse.fromJson(Map<String, dynamic> json) =>
      _$PlantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlantResponseToJson(this);

  @override
  PlantEntity toDomain() => PlantEntity(
    id: id,
    name: name,
    stage: stage,
    score: score,
    plantedAt: plantedAt,
    speciesId: speciesId,
    containerId: containerId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
