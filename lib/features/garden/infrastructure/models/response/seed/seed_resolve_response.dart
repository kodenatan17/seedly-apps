import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/seed/seed_entities.dart';

part 'seed_resolve_response.g.dart';

@JsonSerializable()
class SeedSpeciesRefResponse implements ResponseMapper<SeedSpeciesRefEntity> {
  const SeedSpeciesRefResponse({required this.id, required this.name});

  final String id;
  final String name;

  factory SeedSpeciesRefResponse.fromJson(Map<String, dynamic> json) =>
      _$SeedSpeciesRefResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeedSpeciesRefResponseToJson(this);

  @override
  SeedSpeciesRefEntity toDomain() => SeedSpeciesRefEntity(id: id, name: name);
}

@JsonSerializable()
class SeedResolveResponse implements ResponseMapper<SeedResolveEntity> {
  const SeedResolveResponse({
    required this.code,
    required this.type,
    required this.redemptionRequired,
    required this.status,
    required this.species,
  });

  final String code;
  final String type;
  final bool redemptionRequired;
  final String status;
  final SeedSpeciesRefResponse species;

  factory SeedResolveResponse.fromJson(Map<String, dynamic> json) =>
      _$SeedResolveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeedResolveResponseToJson(this);

  @override
  SeedResolveEntity toDomain() => SeedResolveEntity(
    code: code,
    type: type,
    redemptionRequired: redemptionRequired,
    status: status,
    species: species.toDomain(),
  );
}
