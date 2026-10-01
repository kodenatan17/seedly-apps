import 'package:equatable/equatable.dart';

import '../../../applications/entities/container/container_entities.dart';

/// States for the Garden landing screen.
sealed class GardenState extends Equatable {
  const GardenState();

  @override
  List<Object?> get props => const [];
}

final class GardenLoading extends GardenState {
  const GardenLoading();
}

/// No containers yet, or every container is still unplanted — renders the
/// "Your garden is waiting" hero from the first-login mockup.
final class GardenEmpty extends GardenState {
  const GardenEmpty();
}

final class GardenLoaded extends GardenState {
  const GardenLoaded({required this.containers, required this.totalPlants});

  final List<ContainerEntity> containers;
  final int totalPlants;

  @override
  List<Object?> get props => [containers, totalPlants];
}

final class GardenError extends GardenState {
  const GardenError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
