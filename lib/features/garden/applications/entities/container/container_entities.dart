import 'package:equatable/equatable.dart';

/// Shared container shape reused across list/create/update
/// (`GET|POST|PATCH /v1/garden/containers[/:id]`, contract §2.3.1/3.2/3.4).
///
/// [createdAt] is only populated by the create response and [updatedAt] only
/// by the update response — the list endpoint omits both.
class ContainerEntity extends Equatable {
  const ContainerEntity({
    required this.id,
    required this.capacity,
    required this.currentPlantCount,
    this.deviceId,
    this.createdAt,
    this.updatedAt,
  });

  final String id;

  /// Supported values: 1/3/5.
  final int capacity;
  final int currentPlantCount;

  /// Null when the container has no paired device.
  final String? deviceId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id,
    capacity,
    currentPlantCount,
    deviceId,
    createdAt,
    updatedAt,
  ];
}

/// Embedded device summary on a container detail (contract §2.3.3).
class ContainerDeviceSummaryEntity extends Equatable {
  const ContainerDeviceSummaryEntity({
    required this.id,
    required this.status,
    required this.firmwareVersion,
    required this.lastSeenAt,
  });

  final String id;

  /// e.g. `ONLINE`.
  final String status;
  final String firmwareVersion;
  final DateTime lastSeenAt;

  @override
  List<Object?> get props => [id, status, firmwareVersion, lastSeenAt];
}

/// Embedded plant summary on a container detail (contract §2.3.3).
class ContainerPlantSummaryEntity extends Equatable {
  const ContainerPlantSummaryEntity({
    required this.id,
    required this.name,
    required this.speciesName,
    required this.stage,
    required this.healthScore,
    required this.plantedAt,
  });

  final String id;
  final String name;
  final String speciesName;

  /// e.g. `VEGETATIVE`.
  final String stage;
  final int healthScore;
  final DateTime plantedAt;

  @override
  List<Object?> get props => [
    id,
    name,
    speciesName,
    stage,
    healthScore,
    plantedAt,
  ];
}

/// Full container detail (`GET /v1/garden/containers/:id`, contract §2.3.3).
class ContainerDetailEntity extends Equatable {
  const ContainerDetailEntity({
    required this.id,
    required this.capacity,
    required this.currentPlantCount,
    required this.createdAt,
    required this.updatedAt,
    this.device,
    this.plants = const [],
  });

  final String id;
  final int capacity;
  final int currentPlantCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Null when the container has no paired device.
  final ContainerDeviceSummaryEntity? device;
  final List<ContainerPlantSummaryEntity> plants;

  @override
  List<Object?> get props => [
    id,
    capacity,
    currentPlantCount,
    createdAt,
    updatedAt,
    device,
    plants,
  ];
}
