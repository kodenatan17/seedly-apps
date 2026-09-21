import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/device/device_entities.dart';

part 'device_status_response.g.dart';

@JsonSerializable()
class DeviceStatusResponse implements ResponseMapper<DeviceStatusEntity> {
  const DeviceStatusResponse({
    required this.serialNumber,
    required this.status,
    required this.firmwareVersion,
  });

  final String serialNumber;
  final String status;
  final String firmwareVersion;

  factory DeviceStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceStatusResponseToJson(this);

  @override
  DeviceStatusEntity toDomain() => DeviceStatusEntity(
    serialNumber: serialNumber,
    status: status,
    firmwareVersion: firmwareVersion,
  );
}
