import 'package:equatable/equatable.dart';

/// Events for the career-history surface (cursor-paginated).
sealed class MissionHistoryEvent extends Equatable {
  const MissionHistoryEvent();

  @override
  List<Object?> get props => const [];
}

final class MissionHistoryRequested extends MissionHistoryEvent {
  const MissionHistoryRequested();
}

/// Load the next cursor page; ignored while already loading or exhausted.
final class MissionHistoryLoadMore extends MissionHistoryEvent {
  const MissionHistoryLoadMore();
}

final class MissionHistoryRefreshed extends MissionHistoryEvent {
  const MissionHistoryRefreshed();
}
