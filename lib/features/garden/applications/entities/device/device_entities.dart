import 'package:equatable/equatable.dart';

/// Result of claiming an IoT device via its QR-code serial
/// (`POST /v1/garden/devices/claim`, contract §2.1.1).
class DeviceClaimEntity extends Equatable {
  const DeviceClaimEntity({
    required this.deviceId,
    required this.provisionToken,
    required this.transports,
    required this.firmwareMinVersion,
  });

  final String deviceId;
  final String provisionToken;

  /// e.g. `["ble", "softap"]`.
  final List<String> transports;
  final String firmwareMinVersion;

  @override
  List<Object?> get props => [
    deviceId,
    provisionToken,
    transports,
    firmwareMinVersion,
  ];
}

/// Claim status looked up by serial before pairing
/// (`GET /v1/garden/devices/status/:serial`, contract §2.1.2).
class DeviceStatusEntity extends Equatable {
  const DeviceStatusEntity({
    required this.serialNumber,
    required this.status,
    required this.firmwareVersion,
  });

  final String serialNumber;

  /// e.g. `UNCLAIMED`, `CLAIMED`, `ACTIVE`.
  final String status;
  final String firmwareVersion;

  @override
  List<Object?> get props => [serialNumber, status, firmwareVersion];
}

/// Device lifecycle & runtime status (`GET /v1/garden/devices/:id`,
/// contract §2.1.4).
class DeviceEntity extends Equatable {
  const DeviceEntity({
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

  /// e.g. `ACTIVE`.
  final String status;

  /// e.g. `SLEEPING`, `ONLINE`, `OFFLINE`.
  final String connectionStatus;

  /// e.g. `NORMAL`.
  final String powerMode;
  final DateTime lastSeenAt;
  final int batteryLevel;

  @override
  List<Object?> get props => [
    id,
    serialNumber,
    status,
    connectionStatus,
    powerMode,
    lastSeenAt,
    batteryLevel,
  ];
}
