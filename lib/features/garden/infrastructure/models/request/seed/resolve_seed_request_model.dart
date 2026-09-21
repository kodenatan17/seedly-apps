import 'package:json_annotation/json_annotation.dart';

part 'resolve_seed_request_model.g.dart';

@JsonSerializable()
class ResolveSeedRequestModel {
  const ResolveSeedRequestModel({required this.code});

  final String code;

  factory ResolveSeedRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResolveSeedRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResolveSeedRequestModelToJson(this);
}
