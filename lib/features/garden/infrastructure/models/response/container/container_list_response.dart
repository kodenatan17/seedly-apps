import 'package:json_annotation/json_annotation.dart';

import 'container_response.dart';

part 'container_list_response.g.dart';

/// `GET /v1/garden/containers` wraps the array under `items` (not a bare
/// array, and not cursor-paginated — the spec notes the user's container
/// list is always small).
@JsonSerializable()
class ContainerListResponse {
  const ContainerListResponse({this.items = const []});

  final List<ContainerResponse> items;

  factory ContainerListResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerListResponseToJson(this);
}
