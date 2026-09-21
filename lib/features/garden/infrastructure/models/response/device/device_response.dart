import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/device/device_entities.dart';

part 'device_response.g.dart';

@JsonSerializable()
class DeviceResponse implements ResponseMapper<DeviceEntity> {
  const DeviceResponse({
    required this.id,
    required this.serialNumber,
    required this.status,
    required this.connectionStatus,
    required this.powerMode,
    required this.lastSeenAt,
    required this.batteryLevel,
  });

  final String id;
  final String serialNumber;
  final String status;
  final String connectionStatus;
  final String powerMode;
  final DateTime lastSeenAt;
  final int batteryLevel;

  factory DeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceResponseToJson(this);

  @override
  DeviceEntity toDomain() => DeviceEntity(
    id: id,
    serialNumber: serialNumber,
    status: status,
    connectionStatus: connectionStatus,
    powerMode: powerMode,
    lastSeenAt: lastSeenAt,
    batteryLevel: batteryLevel,
  );
}
