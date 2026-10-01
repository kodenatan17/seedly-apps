import 'package:equatable/equatable.dart';

import '../../../../l10n/l10n.dart';
import '../../applications/entities/seed/seed_entities.dart';
import '../../applications/entities/species/species_entities.dart';
import 'garden_seed_metadata.dart';

/// Carries the species/seed the user picked (via catalogue, QR scan or a
/// typed code) forward into the container-selection step.
///
/// Built once, right after resolution, and passed between routes via
/// `extra` — screens themselves never call [ResolveSeedCodeUseCase] or
/// [ListSpeciesUseCase] again.
class GardenSeedSelectionUiModel extends Equatable {
  const GardenSeedSelectionUiModel({
    required this.title,
    required this.subtitle,
    required this.speciesName,
    required this.metadata,
    this.speciesId,
    this.kitCode,
  }) : assert(
         (speciesId == null) != (kitCode == null),
         'exactly one of speciesId/kitCode must be set',
       );

  factory GardenSeedSelectionUiModel.fromSpecies(
    SpeciesEntity species,
    AppLocalizations l10n,
  ) {
    return GardenSeedSelectionUiModel(
      title: l10n.adventureSuffixTitle(species.name),
      subtitle: l10n.directPlantSubtitle,
      speciesName: species.name,
      metadata: GardenSeedMetadata.of(species.name),
      speciesId: species.id,
    );
  }

  factory GardenSeedSelectionUiModel.fromSeedResolve(
    SeedResolveEntity resolved,
    AppLocalizations l10n,
  ) {
    return GardenSeedSelectionUiModel(
      title: l10n.adventureSuffixTitle(resolved.species.name),
      subtitle: l10n.kitKeywordSubtitle(resolved.species.name),
      speciesName: resolved.species.name,
      metadata: GardenSeedMetadata.of(resolved.species.name),
      kitCode: resolved.code,
    );
  }

  final String title;
  final String subtitle;
  final String speciesName;
  final GardenSeedMetadata metadata;

  /// Set when the selection came from the catalogue. Mutually exclusive
  /// with [kitCode] — `POST /v1/garden/plants` requires exactly one.
  final String? speciesId;

  /// Set when the selection came from a resolved seed/kit code.
  final String? kitCode;

  @override
  List<Object?> get props => [
    title,
    subtitle,
    speciesName,
    metadata,
    speciesId,
    kitCode,
  ];
}
