import 'package:json_annotation/json_annotation.dart';

part 'claim_device_request_model.g.dart';

@JsonSerializable()
class ClaimDeviceRequestModel {
  const ClaimDeviceRequestModel({required this.serialNumber});

  @JsonKey(name: 'serial_number')
  final String serialNumber;

  factory ClaimDeviceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimDeviceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimDeviceRequestModelToJson(this);
}
