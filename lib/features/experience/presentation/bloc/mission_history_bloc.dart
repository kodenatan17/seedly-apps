import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/error/mission_failure.dart';
import '../../applications/usecases/get_mission_history_usecase.dart';
import 'mission_history_event.dart';
import 'mission_history_state.dart';

/// Bloc for the completed-mission history screen (spec §14 `/history`).
class MissionHistoryBloc
    extends Bloc<MissionHistoryEvent, MissionHistoryState> {
  MissionHistoryBloc({required GetMissionHistoryUseCase getHistory})
      : _getHistory = getHistory,
        super(const MissionHistoryLoading()) {
    on<MissionHistoryRequested>(_onRequested);
    on<MissionHistoryRefreshed>(_onRequested);
    on<MissionHistoryLoadMore>(_onLoadMore);
  }

  final GetMissionHistoryUseCase _getHistory;

  Future<void> _onRequested(
    MissionHistoryEvent event,
    Emitter<MissionHistoryState> emit,
  ) async {
    emit(const MissionHistoryLoading());
    try {
      final page = await _getHistory();
      emit(MissionHistoryLoaded(
        items: page.items,
        nextCursor: page.nextCursor,
      ));
    } on MissionFailure catch (failure) {
      emit(MissionHistoryError(failure));
    }
  }

  Future<void> _onLoadMore(
    MissionHistoryLoadMore event,
    Emitter<MissionHistoryState> emit,
  ) async {
    final current = state;
    // Guard against duplicate in-flight loads from scroll listeners.
    if (current is! MissionHistoryLoaded ||
        current.isLoadingMore ||
        !current.hasMore) {
      return;
    }
    emit(current.copyWith(isLoadingMore: true));
    try {
      final page = await _getHistory(cursor: current.nextCursor);
      emit(MissionHistoryLoaded(
        items: [...current.items, ...page.items],
        nextCursor: page.nextCursor,
      ));
    } on MissionFailure catch (failure) {
      // Keep the already-loaded pages visible; flag the failure so the UI can
      // offer a retry without destroying state.
      emit(current.copyWith(
        isLoadingMore: false,
        loadMoreFailure: failure,
      ));
    }
  }
}
