import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/device/device_entities.dart';

part 'device_claim_response.g.dart';

@JsonSerializable()
class FirmwareInfoResponse {
  const FirmwareInfoResponse({required this.minVersion});

  final String minVersion;

  factory FirmwareInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$FirmwareInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FirmwareInfoResponseToJson(this);
}

@JsonSerializable()
class DeviceClaimResponse implements ResponseMapper<DeviceClaimEntity> {
  const DeviceClaimResponse({
    required this.deviceId,
    required this.provisionToken,
    required this.transports,
    required this.firmware,
  });

  final String deviceId;
  final String provisionToken;
  final List<String> transports;
  final FirmwareInfoResponse firmware;

  factory DeviceClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceClaimResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceClaimResponseToJson(this);

  @override
  DeviceClaimEntity toDomain() => DeviceClaimEntity(
    deviceId: deviceId,
    provisionToken: provisionToken,
    transports: transports,
    firmwareMinVersion: firmware.minVersion,
  );
}
