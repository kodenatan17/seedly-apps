import 'package:equatable/equatable.dart';

import '../../../../cores/error/mission_failure.dart';
import '../../applications/entities/mission_instance.dart';

/// States for the mission list/detail surface (task contract: Loading /
/// Loaded / Error).
sealed class MissionState extends Equatable {
  const MissionState();

  @override
  List<Object?> get props => const [];
}

final class MissionLoading extends MissionState {
  const MissionLoading();
}

final class MissionLoaded extends MissionState {
  const MissionLoaded(this.missions);

  final List<MissionInstance> missions;

  bool get isEmpty => missions.isEmpty;

  MissionInstance? missionById(String id) {
    for (final m in missions) {
      if (m.id == id) return m;
    }
    return null;
  }

  @override
  List<Object?> get props => [missions];
}

final class MissionError extends MissionState {
  const MissionError(this.failure);

  final MissionFailure failure;

  @override
  List<Object?> get props => [failure.message, failure.type];
}

/// A single mission with full objective detail.
///
/// Distinct from [MissionLoaded] so a detail fetch (deep link, navigation)
/// never clobbers the list collection; the list's last [MissionLoaded] state
/// is intentionally not retained here — a returning list screen re-triggers
/// [MissionRequested] through its route entry.
final class MissionDetailLoaded extends MissionState {
  const MissionDetailLoaded(this.mission);

  final MissionInstance mission;

  @override
  List<Object?> get props => [mission.id];
}
