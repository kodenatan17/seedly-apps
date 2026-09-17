import 'package:equatable/equatable.dart';

/// Events for the mission list/detail surface.
///
/// The module is read-only (spec §14) — every event is a fetch or a refresh.
sealed class MissionEvent extends Equatable {
  const MissionEvent();

  @override
  List<Object?> get props => const [];
}

/// Initial load of the mission list.
final class MissionRequested extends MissionEvent {
  const MissionRequested();
}

/// Explicit user retry after a failure.
final class MissionRefreshed extends MissionEvent {
  const MissionRefreshed();
}

/// Load one mission instance with its objective breakdown.
final class MissionDetailRequested extends MissionEvent {
  const MissionDetailRequested(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

/// Reset to the loading state (used when re-entering the list screen).
final class MissionReset extends MissionEvent {
  const MissionReset();
}
