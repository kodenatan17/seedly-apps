import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/error/mission_failure.dart';
import '../../applications/usecases/get_mission_detail_usecase.dart';
import '../../applications/usecases/get_missions_usecase.dart';
import 'mission_event.dart';
import 'mission_state.dart';

/// Bloc owning the mission list and detail state.
///
/// Read-only by design (spec §14): it never calls a mutation endpoint. A
/// detail fetch is resolved from the loaded list when present and otherwise
/// hits `GET /v1/me/missions/:id` (deep-link path).
class MissionBloc extends Bloc<MissionEvent, MissionState> {
  MissionBloc({
    required GetMissionsUseCase getMissions,
    required GetMissionDetailUseCase getMissionDetail,
  })  : _getMissions = getMissions,
        _getMissionDetail = getMissionDetail,
        super(const MissionLoading()) {
    on<MissionRequested>(_onRequested);
    on<MissionRefreshed>(_onRequested);
    on<MissionDetailRequested>(_onDetailRequested);
    on<MissionReset>(_onReset);
  }

  final GetMissionsUseCase _getMissions;
  final GetMissionDetailUseCase _getMissionDetail;

  Future<void> _onRequested(
    MissionEvent event,
    Emitter<MissionState> emit,
  ) async {
    emit(const MissionLoading());
    try {
      final missions = await _getMissions();
      emit(MissionLoaded(missions));
    } on MissionFailure catch (failure) {
      emit(MissionError(failure));
    }
  }

  Future<void> _onDetailRequested(
    MissionDetailRequested event,
    Emitter<MissionState> emit,
  ) async {
    // Already have full detail in memory — avoid a redundant round-trip.
    final current = state;
    if (current is MissionLoaded) {
      final cached = current.missionById(event.id);
      if (cached != null && cached.objectives.isNotEmpty) return;
    }

    emit(const MissionLoading());
    try {
      final mission = await _getMissionDetail(event.id);
      emit(MissionDetailLoaded(mission));
    } on MissionFailure catch (failure) {
      emit(MissionError(failure));
    }
  }

  void _onReset(MissionReset event, Emitter<MissionState> emit) {
    emit(const MissionLoading());
  }
}
