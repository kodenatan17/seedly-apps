import 'package:equatable/equatable.dart';

/// Full plant detail (`GET /v1/garden/plants/:id`, contract §2.4.4 — this
/// endpoint is not documented anywhere in the spec; the shape below is
/// inferred from the `Plant` domain model and the `plants` table columns.
/// There is deliberately no `deviceId`: `add-seed-feature.md` drops
/// `device_id` from `plants` in favour of the `containerId` relation).
class PlantEntity extends Equatable {
  const PlantEntity({
    required this.id,
    required this.name,
    required this.stage,
    required this.score,
    required this.plantedAt,
    required this.speciesId,
    required this.containerId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;

  /// e.g. `SEED`, `VEGETATIVE`.
  final String stage;
  final int score;
  final DateTime plantedAt;
  final String speciesId;
  final String containerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
    id,
    name,
    stage,
    score,
    plantedAt,
    speciesId,
    containerId,
    createdAt,
    updatedAt,
  ];
}

/// `POST /v1/garden/plants` response (contract §2.4.3).
///
/// The API intentionally echoes back only these 4 fields — `name`,
/// `speciesId`, `plantedAt` and `userId` are known server-side but are not
/// part of the create response; do not add them without marking inferred.
class PlantCreateResultEntity extends Equatable {
  const PlantCreateResultEntity({
    required this.id,
    required this.status,
    required this.healthScore,
    required this.containerId,
  });

  final String id;

  /// Server-set to `SEED` on creation.
  final String status;

  /// Server-set default of `50` on creation.
  final int healthScore;
  final String containerId;

  @override
  List<Object?> get props => [id, status, healthScore, containerId];
}
