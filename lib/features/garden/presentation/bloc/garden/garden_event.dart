import 'package:equatable/equatable.dart';

/// Events for the Garden landing screen (`garden_screen.dart`).
sealed class GardenEvent extends Equatable {
  const GardenEvent();

  @override
  List<Object?> get props => const [];
}

/// Initial load of the user's containers.
final class GardenRequested extends GardenEvent {
  const GardenRequested();
}

/// Explicit user retry / pull-to-refresh.
final class GardenRefreshed extends GardenEvent {
  const GardenRefreshed();
}
