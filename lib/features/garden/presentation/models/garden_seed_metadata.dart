import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../atomic/colors/colors.dart';

/// Presentation-only care metadata for a species, keyed by species name
/// (case-insensitive).
///
/// The species catalogue API (`GET /v1/garden/species`) deliberately exposes
/// only `id`/`name`/`isActive` — `growProfile`/`stageRules`/`imageUrl` exist
/// as DB columns but are not part of the contract yet
/// (`species_entities.dart` doc comment). This content therefore cannot come
/// from l10n either: species names are server-driven, open-ended strings, not
/// a fixed set of ICU message keys. [GardenSeedMetadata.of] returns a
/// reasonable generic fallback for any species not in the illustrative demo
/// set below, so the UI stays correct once real species are added.
class GardenSeedMetadata extends Equatable {
  const GardenSeedMetadata({
    required this.description,
    required this.difficultyLabel,
    required this.lightLabel,
    required this.icon,
    required this.gradient,
    required this.journey,
  });

  final String description;
  final String difficultyLabel;
  final String lightLabel;
  final IconData icon;
  final Gradient gradient;
  final List<GardenJourneyStage> journey;

  @override
  List<Object?> get props => [
    description,
    difficultyLabel,
    lightLabel,
    icon,
    gradient,
    journey,
  ];

  static const _fallback = GardenSeedMetadata(
    description: 'A resilient companion for your GrowPico garden.',
    difficultyLabel: 'Easy',
    lightLabel: 'Full Sun',
    icon: Icons.eco,
    gradient: AppGradients.avatar,
    journey: [
      GardenJourneyStage(label: 'Sprouting', durationLabel: '7-10 Days'),
      GardenJourneyStage(label: 'Flowering', durationLabel: '30-40 Days'),
      GardenJourneyStage(label: 'Harvest', durationLabel: '60-70 Days'),
    ],
  );

  static final Map<String, GardenSeedMetadata> _bySpeciesName = {
    'tomato': const GardenSeedMetadata(
      description: 'Loves full sun and consistent watering.',
      difficultyLabel: 'Easy',
      lightLabel: 'Full Sun',
      icon: Icons.local_florist,
      gradient: AppGradients.avatar,
      journey: [
        GardenJourneyStage(label: 'Sprouting', durationLabel: '7-10 Days'),
        GardenJourneyStage(label: 'Flowering', durationLabel: '30-40 Days'),
        GardenJourneyStage(label: 'Harvest', durationLabel: '60-70 Days'),
      ],
    ),
    'lettuce': const GardenSeedMetadata(
      description: 'Prefers cooler climates and partial shade.',
      difficultyLabel: 'Easy',
      lightLabel: 'Partial Shade',
      icon: Icons.grass,
      gradient: AppGradients.avatar,
      journey: [
        GardenJourneyStage(label: 'Sprouting', durationLabel: '5-7 Days'),
        GardenJourneyStage(label: 'Leafing', durationLabel: '20-30 Days'),
        GardenJourneyStage(label: 'Harvest', durationLabel: '35-45 Days'),
      ],
    ),
    'chili pepper': const GardenSeedMetadata(
      description: 'Thrives in heat and needs well-drained soil.',
      difficultyLabel: 'Medium',
      lightLabel: 'Full Sun',
      icon: Icons.local_fire_department,
      gradient: AppGradients.cta,
      journey: [
        GardenJourneyStage(label: 'Sprouting', durationLabel: '10-14 Days'),
        GardenJourneyStage(label: 'Flowering', durationLabel: '40-50 Days'),
        GardenJourneyStage(label: 'Harvest', durationLabel: '70-85 Days'),
      ],
    ),
    'sunflower': const GardenSeedMetadata(
      description: 'Needs plenty of space and bright sunlight.',
      difficultyLabel: 'Easy',
      lightLabel: 'Full Sun',
      icon: Icons.wb_sunny,
      gradient: AppGradients.legendaryBorder,
      journey: [
        GardenJourneyStage(label: 'Sprouting', durationLabel: '7-10 Days'),
        GardenJourneyStage(label: 'Budding', durationLabel: '30-45 Days'),
        GardenJourneyStage(label: 'Bloom', durationLabel: '70-90 Days'),
      ],
    ),
  };

  static GardenSeedMetadata of(String speciesName) =>
      _bySpeciesName[speciesName.trim().toLowerCase()] ?? _fallback;
}

class GardenJourneyStage extends Equatable {
  const GardenJourneyStage({required this.label, required this.durationLabel});

  final String label;
  final String durationLabel;

  @override
  List<Object?> get props => [label, durationLabel];
}
