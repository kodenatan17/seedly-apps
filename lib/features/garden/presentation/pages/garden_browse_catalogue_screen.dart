import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../../applications/entities/species/species_entities.dart';
import '../bloc/species_catalogue/species_catalogue_bloc.dart';
import '../bloc/species_catalogue/species_catalogue_event.dart';
import '../bloc/species_catalogue/species_catalogue_state.dart';
import '../widgets/species_catalogue_card.dart';

/// Seed catalogue browser — route entry point, exported by `public_api.dart`.
///
/// The header intentionally mirrors the mockup (grid + "GrowPico" wordmark +
/// bell, no back arrow); the grid icon doubles as the back affordance when
/// [onBack] is supplied, since this screen can also be reached without one.
class GardenBrowseCatalogueScreen extends StatefulWidget {
  const GardenBrowseCatalogueScreen({
    super.key,
    this.onBack,
    this.onOpenNotifications,
    required this.onSelectSpecies,
  });

  final VoidCallback? onBack;
  final VoidCallback? onOpenNotifications;
  final ValueChanged<SpeciesEntity> onSelectSpecies;

  @override
  State<GardenBrowseCatalogueScreen> createState() =>
      _GardenBrowseCatalogueScreenState();
}

class _GardenBrowseCatalogueScreenState
    extends State<GardenBrowseCatalogueScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SpeciesCatalogueBloc>().add(const SpeciesCatalogueRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.grid_view_rounded),
                    color: AppColors.textPrimary,
                    onPressed: widget.onBack,
                  ),
                  Expanded(
                    child: BaseText(
                      'GrowPico',
                      style: AppTypography.headingS,
                      color: AppColors.greenDark,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    color: AppColors.textPrimary,
                    onPressed: widget.onOpenNotifications,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SpeciesCatalogueBloc, SpeciesCatalogueState>(
                builder: (context, state) {
                  return switch (state) {
                    SpeciesCatalogueLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    SpeciesCatalogueError(:final message) => _ErrorState(
                      message: message,
                      onRetry: () => context.read<SpeciesCatalogueBloc>().add(
                        const SpeciesCatalogueRequested(),
                      ),
                    ),
                    SpeciesCatalogueLoaded(:final species) =>
                      ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        itemCount: species.length + 1,
                        separatorBuilder: (_, _) => const BaseGap.v(16),
                        itemBuilder: (context, index) {
                          if (index == 0) return const _CatalogueHeader();
                          final item = species[index - 1];
                          return SpeciesCatalogueCard(
                            species: item,
                            onAddSeed: () => widget.onSelectSpecies(item),
                          );
                        },
                      ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CatalogueHeader extends StatelessWidget {
  const _CatalogueHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          BaseText(
            l10n.seedCatalogueTitle,
            style: AppTypography.headingL,
            color: AppColors.greenDark,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(12),
          BaseText(
            l10n.seedCatalogueDescription,
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 40, color: AppColors.textMuted),
            const BaseGap.v(12),
            BaseText(
              message,
              style: AppTypography.bodyM,
              color: AppColors.textSecondary,
              textAlign: TextAlign.center,
            ),
            const BaseGap.v(16),
            BaseButton(
              label: context.l10n.retryButtonLabel,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
