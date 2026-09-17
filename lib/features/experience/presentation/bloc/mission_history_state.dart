import 'package:equatable/equatable.dart';

import '../../../../cores/error/mission_failure.dart';
import '../../applications/entities/mission_instance.dart';

/// States for the career-history surface.
sealed class MissionHistoryState extends Equatable {
  const MissionHistoryState();

  @override
  List<Object?> get props => const [];
}

final class MissionHistoryLoading extends MissionHistoryState {
  const MissionHistoryLoading();
}

final class MissionHistoryLoaded extends MissionHistoryState {
  const MissionHistoryLoaded({
    required this.items,
    this.nextCursor,
    this.isLoadingMore = false,
    this.loadMoreFailure,
  });

  final List<MissionInstance> items;
  final String? nextCursor;
  final bool isLoadingMore;

  /// Set when a *load-more* attempt failed. The already-loaded [items] stay
  /// visible — a failed page never blanks the screen (non-destructive error).
  final MissionFailure? loadMoreFailure;

  bool get hasMore => nextCursor != null;
  bool get isEmpty => items.isEmpty;

  MissionHistoryLoaded copyWith({
    List<MissionInstance>? items,
    String? nextCursor,
    bool? isLoadingMore,
    MissionFailure? loadMoreFailure,
    bool clearLoadMoreFailure = false,
  }) =>
      MissionHistoryLoaded(
        items: items ?? this.items,
        nextCursor: nextCursor ?? this.nextCursor,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        loadMoreFailure:
            clearLoadMoreFailure ? null : (loadMoreFailure ?? this.loadMoreFailure),
      );

  @override
  List<Object?> get props => [items, nextCursor, isLoadingMore, loadMoreFailure];
}

/// Only emitted when the *initial* page fails (nothing to show yet).
final class MissionHistoryError extends MissionHistoryState {
  const MissionHistoryError(this.failure);

  final MissionFailure failure;

  @override
  List<Object?> get props => [failure.message, failure.type];
}
