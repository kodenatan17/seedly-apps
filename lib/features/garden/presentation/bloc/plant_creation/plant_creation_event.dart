import 'package:equatable/equatable.dart';

import '../../models/garden_seed_selection.dart';

/// Events for `garden_choose_container_screen.dart`.
sealed class PlantCreationEvent extends Equatable {
  const PlantCreationEvent();

  @override
  List<Object?> get props => const [];
}

/// Loads the user's containers to populate the Smart Pot grid.
final class PlantCreationContainersRequested extends PlantCreationEvent {
  const PlantCreationContainersRequested();
}

final class PlantCreationContainerSelected extends PlantCreationEvent {
  const PlantCreationContainerSelected(this.containerId);

  final String containerId;

  @override
  List<Object?> get props => [containerId];
}

/// "Confirm Planting" — submits the selected container together with the
/// seed/species chosen earlier in the flow.
final class PlantCreationSubmitted extends PlantCreationEvent {
  const PlantCreationSubmitted({required this.name, required this.selection});

  final String name;
  final GardenSeedSelectionUiModel selection;

  @override
  List<Object?> get props => [name, selection];
}
