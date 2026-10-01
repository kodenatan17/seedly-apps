import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../../applications/entities/species/species_entities.dart';
import '../models/garden_seed_metadata.dart';

/// One species card on `garden_browse_catalogue_screen.dart`.
class SpeciesCatalogueCard extends StatelessWidget {
  const SpeciesCatalogueCard({
    super.key,
    required this.species,
    required this.onAddSeed,
  });

  final SpeciesEntity species;
  final VoidCallback? onAddSeed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final metadata = GardenSeedMetadata.of(species.name);

    return BaseCard(
      child: Column(
        children: [
          BaseIcon(
            metadata.icon,
            size: 40,
            color: AppColors.white,
            backgroundGradient: metadata.gradient,
            backgroundSize: 110,
            borderColor: AppColors.border,
            borderWidth: 1,
          ),
          const BaseGap.v(16),
          BaseText(species.name, style: AppTypography.headingS),
          const BaseGap.v(6),
          BaseText(
            metadata.description,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(16),
          BaseButton(
            label: species.isActive
                ? l10n.addSeedButton
                : l10n.inactiveSpeciesBadge,
            leadingIcon: species.isActive ? Icons.add : null,
            isExpanded: true,
            onPressed: species.isActive ? onAddSeed : null,
          ),
        ],
      ),
    );
  }
}
