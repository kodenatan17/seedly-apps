import 'package:equatable/equatable.dart';

/// Species reference embedded in a resolved seed/kit code.
class SeedSpeciesRefEntity extends Equatable {
  const SeedSpeciesRefEntity({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

/// Result of resolving a seed/kit code (`POST /v1/garden/seeds/resolve`,
/// contract §2.4.2).
class SeedResolveEntity extends Equatable {
  const SeedResolveEntity({
    required this.code,
    required this.type,
    required this.redemptionRequired,
    required this.status,
    required this.species,
  });

  final String code;

  /// `KIT` is the only confirmed value — the spec only documents the kit-code
  /// path; a species-only/QR-only variant is not yet defined.
  final String type;
  final bool redemptionRequired;

  /// One of `AVAILABLE|REDEEMED|DISABLED`.
  final String status;
  final SeedSpeciesRefEntity species;

  @override
  List<Object?> get props => [code, type, redemptionRequired, status, species];
}
