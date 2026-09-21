import 'package:json_annotation/json_annotation.dart';

import 'species_response.dart';

part 'species_list_response.g.dart';

/// `GET /v1/garden/species` wraps the array under `items`.
@JsonSerializable()
class SpeciesListResponse {
  const SpeciesListResponse({this.items = const []});

  final List<SpeciesResponse> items;

  factory SpeciesListResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeciesListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesListResponseToJson(this);
}
