import 'package:json_annotation/json_annotation.dart';

part 'quest_submit_request_model.g.dart';

@JsonSerializable()
class QuestSubmitRequestModel {
  /// Verification-specific inner keys (inferred — spec only shows the
  /// `payload` wrapper, e.g. `{ "note": "fertilized with 10-10-10 mix" }`).
  final Map<String, dynamic> payload;

  const QuestSubmitRequestModel({required this.payload});

  factory QuestSubmitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$QuestSubmitRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestSubmitRequestModelToJson(this);
}
