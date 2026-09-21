import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/species/species_entities.dart';

part 'species_response.g.dart';

/// The API returns `is_active` (snake_case), inconsistent with the global
/// camelCase convention (api_contracts_backend.md §2 note) — preserved
/// literally via [JsonKey] rather than "fixed" client-side.
@JsonSerializable()
class SpeciesResponse implements ResponseMapper<SpeciesEntity> {
  const SpeciesResponse({
    required this.id,
    required this.name,
    required this.isActive,
  });

  final String id;
  final String name;

  @JsonKey(name: 'is_active')
  final bool isActive;

  factory SpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeciesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesResponseToJson(this);

  @override
  SpeciesEntity toDomain() =>
      SpeciesEntity(id: id, name: name, isActive: isActive);
}
