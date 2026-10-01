import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../../applications/entities/plant/plant_entities.dart';
import '../bloc/plant_creation/plant_creation_bloc.dart';
import '../bloc/plant_creation/plant_creation_event.dart';
import '../bloc/plant_creation/plant_creation_state.dart';
import '../models/garden_seed_selection.dart';
import '../widgets/container_slot_card.dart';
import '../widgets/journey_timeline.dart';

/// Seed info & container selection — route entry point, exported by
/// `public_api.dart`. Receives the [selection] chosen on a previous screen
/// (catalogue / QR / code) and submits `POST /v1/garden/plants` on confirm.
class GardenChooseContainerScreen extends StatefulWidget {
  const GardenChooseContainerScreen({
    super.key,
    required this.selection,
    this.plantName = 'Tommy',
    this.onBack,
    this.onClose,
    required this.onPlantCreated,
  });

  final GardenSeedSelectionUiModel selection;

  /// Nickname given to the new plant. Placeholder default until a "name
  /// your plant" step is designed — not part of the provided mockups.
  final String plantName;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final ValueChanged<PlantCreateResultEntity> onPlantCreated;

  @override
  State<GardenChooseContainerScreen> createState() =>
      _GardenChooseContainerScreenState();
}

class _GardenChooseContainerScreenState
    extends State<GardenChooseContainerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlantCreationBloc>().add(
      const PlantCreationContainersRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final metadata = widget.selection.metadata;

    return Scaffold(
      appBar: BaseAppBar(
        title: 'Seedly',
        onBack: widget.onBack,
        onClose: widget.onClose,
      ),
      body: SafeArea(
        child: BlocConsumer<PlantCreationBloc, PlantCreationState>(
          listener: (context, state) {
            if (state.status == PlantCreationStatus.success &&
                state.result != null) {
              widget.onPlantCreated(state.result!);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: BaseIcon(
                      metadata.icon,
                      size: 56,
                      color: AppColors.white,
                      backgroundGradient: metadata.gradient,
                      backgroundSize: 140,
                      borderColor: AppColors.border,
                      borderWidth: 4,
                    ),
                  ),
                  const BaseGap.v(20),
                  BaseText(
                    widget.selection.title,
                    style: AppTypography.headingM,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(4),
                  BaseText(
                    widget.selection.subtitle,
                    style: AppTypography.bodyM,
                    color: AppColors.textSecondary,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseBadge(
                        label: metadata.difficultyLabel,
                        icon: Icons.eco,
                        backgroundColor: AppColors.yellowLight,
                        foregroundColor: AppColors.yellowText,
                      ),
                      const BaseGap.h(8),
                      BaseBadge(
                        label: metadata.lightLabel,
                        icon: Icons.wb_sunny_outlined,
                        backgroundColor: AppColors.divider,
                        foregroundColor: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  const BaseGap.v(24),
                  BaseCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          l10n.expectedJourneyTitle,
                          style: AppTypography.headingS,
                        ),
                        const BaseGap.v(16),
                        JourneyTimeline(stages: metadata.journey),
                      ],
                    ),
                  ),
                  const BaseGap.v(24),
                  BaseText(
                    l10n.whereWillYouGrow(widget.plantName),
                    style: AppTypography.headingS,
                  ),
                  const BaseGap.v(12),
                  _ContainerGrid(state: state),
                  if (state.status == PlantCreationStatus.error &&
                      state.errorMessage != null) ...[
                    const BaseGap.v(12),
                    BaseText(
                      state.errorMessage!,
                      style: AppTypography.bodyS,
                      color: AppColors.error,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const BaseGap.v(20),
                  BaseButton(
                    label: l10n.confirmPlantingButton,
                    isExpanded: true,
                    size: BaseButtonSize.large,
                    isLoading: state.status == PlantCreationStatus.submitting,
                    onPressed: state.canSubmit
                        ? () => context.read<PlantCreationBloc>().add(
                            PlantCreationSubmitted(
                              name: widget.plantName,
                              selection: widget.selection,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ContainerGrid extends StatelessWidget {
  const _ContainerGrid({required this.state});

  final PlantCreationState state;

  @override
  Widget build(BuildContext context) {
    if (state.status == PlantCreationStatus.loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (state.slots.isEmpty) {
      return const SizedBox.shrink();
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.05,
      ),
      itemCount: state.slots.length,
      itemBuilder: (context, index) {
        final slot = state.slots[index];
        return ContainerSlotCard(
          slot: slot,
          isSelected: slot.id == state.selectedContainerId,
          onTap: () => context.read<PlantCreationBloc>().add(
            PlantCreationContainerSelected(slot.id),
          ),
        );
      },
    );
  }
}
