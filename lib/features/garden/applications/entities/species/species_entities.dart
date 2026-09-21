import 'package:equatable/equatable.dart';

/// Species catalogue entry (`GET /v1/garden/species`, contract §2.4.1).
///
/// The spec deliberately exposes only these 3 fields — `growProfile`,
/// `stageRules` and `imageUrl` exist as DB columns but are not part of this
/// contract yet; do not add them speculatively.
class SpeciesEntity extends Equatable {
  const SpeciesEntity({
    required this.id,
    required this.name,
    required this.isActive,
  });

  final String id;
  final String name;
  final bool isActive;

  @override
  List<Object?> get props => [id, name, isActive];
}
