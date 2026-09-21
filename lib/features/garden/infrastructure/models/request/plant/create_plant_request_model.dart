import 'package:json_annotation/json_annotation.dart';

part 'create_plant_request_model.g.dart';

/// `kitCode` XOR `speciesId` — exactly one must be non-null; the caller
/// (`GardenRemoteDataSource`) is responsible for that invariant, this model
/// only carries whichever was supplied.
@JsonSerializable(includeIfNull: false)
class CreatePlantRequestModel {
  const CreatePlantRequestModel({
    required this.name,
    required this.containerId,
    this.kitCode,
    this.speciesId,
  });

  final String name;
  final String containerId;
  final String? kitCode;
  final String? speciesId;

  factory CreatePlantRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePlantRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePlantRequestModelToJson(this);
}
