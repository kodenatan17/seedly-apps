import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/error/mission_failure.dart';
import '../bloc/mission_history_bloc.dart';
import '../bloc/mission_history_event.dart';
import '../bloc/mission_history_state.dart';
import '../widgets/mission_card.dart';
import '../widgets/mission_error_view.dart';

/// Completed-mission history screen (spec §14 `/history`, newest first).
///
/// Route entry point — exported by `public_api.dart`. Infinite scroll via
/// [ScrollController] + [MissionHistoryLoadMore].
class MissionHistoryScreen extends StatefulWidget {
  const MissionHistoryScreen({super.key});

  @override
  State<MissionHistoryScreen> createState() => _MissionHistoryScreenState();
}

class _MissionHistoryScreenState extends State<MissionHistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      context.read<MissionHistoryBloc>().add(const MissionHistoryLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mission History')),
      body: BlocBuilder<MissionHistoryBloc, MissionHistoryState>(
        builder: (context, state) {
          return switch (state) {
            MissionHistoryLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MissionHistoryError(:final failure) => _historyError(failure),
            MissionHistoryLoaded(:final items) => RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<MissionHistoryBloc>()
                      .add(const MissionHistoryRefreshed());
                },
                child: items.isEmpty
                    ? const _EmptyState()
                    : ListView.separated(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: items.length + 1,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          if (index == items.length) {
                            return _LoadMoreIndicator(
                              isLoadingMore: state.isLoadingMore,
                              hasMore: state.hasMore,
                              failure: state.loadMoreFailure,
                              onRetry: () => context
                                  .read<MissionHistoryBloc>()
                                  .add(const MissionHistoryLoadMore()),
                            );
                          }
                          return MissionCard(
                            mission: items[index],
                            showCompletedAt: true,
                          );
                        },
                      ),
              ),
          };
        },
      ),
    );
  }

  Widget _historyError(MissionFailure failure) {
    return MissionErrorView(
      failure: failure,
      onRetry: () => context
          .read<MissionHistoryBloc>()
          .add(const MissionHistoryRefreshed()),
    );
  }
}

class _LoadMoreIndicator extends StatelessWidget {
  const _LoadMoreIndicator({
    required this.isLoadingMore,
    required this.hasMore,
    this.failure,
    this.onRetry,
  });

  final bool isLoadingMore;
  final bool hasMore;
  final MissionFailure? failure;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (failure != null) {
      // Non-destructive: prior pages stay visible; offer a retry inline.
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text(failure!.message),
          ),
        ),
      );
    }
    if (!hasMore) {
      return const SizedBox.shrink();
    }
    // The ScrollController listener handles triggering the fetch.
    return const SizedBox.shrink();
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Icon(
                Icons.emoji_events_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 12),
              const Text('No completed missions yet.'),
            ],
          ),
        ),
      ],
    );
  }
}
