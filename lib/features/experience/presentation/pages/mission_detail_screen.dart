import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/error/mission_failure.dart';
import '../../applications/entities/mission_instance.dart';
import '../bloc/mission_bloc.dart';
import '../bloc/mission_event.dart';
import '../bloc/mission_state.dart';
import '../widgets/mission_error_view.dart';
import '../widgets/mission_objective_item.dart';

/// Mission detail screen with per-objective progress bars (spec §18).
///
/// Route entry point — exported by `public_api.dart`. Dispatches
/// [MissionDetailRequested] on entry so it works for both deep links and
/// navigation from the list.
class MissionDetailScreen extends StatefulWidget {
  const MissionDetailScreen({required this.missionId, super.key});

  final String missionId;

  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<MissionBloc>()
        .add(MissionDetailRequested(widget.missionId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mission')),
      body: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          return switch (state) {
            MissionLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MissionError(:final failure) => MissionErrorView(
                failure: failure,
                onRetry: () => context
                    .read<MissionBloc>()
                    .add(MissionDetailRequested(widget.missionId)),
              ),
            MissionDetailLoaded(:final mission) => _Detail(
                mission: mission,
                onRetry: () => context
                    .read<MissionBloc>()
                    .add(MissionDetailRequested(widget.missionId)),
              ),
            MissionLoaded(:final missions) => _Detail(
                mission: _findById(missions, widget.missionId),
                onRetry: () => context
                    .read<MissionBloc>()
                    .add(MissionDetailRequested(widget.missionId)),
              ),
          };
        },
      ),
    );
  }
}

/// Dart 3.10 `firstOrNull` is available on Iterable via collection extensions
/// but we avoid the import for one call — a small explicit lookup keeps the
/// module dependency-light.
MissionInstance? _findById(List<MissionInstance> missions, String id) {
  for (final m in missions) {
    if (m.id == id) return m;
  }
  return null;
}

class _Detail extends StatelessWidget {
  const _Detail({required this.mission, required this.onRetry});

  /// Null when the mission id is not in the loaded list — treated as a
  /// not-found state (can happen on a stale deep link).
  final MissionInstance? mission;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final m = mission;
    if (m == null) {
      return MissionErrorView(
        failure: const MissionFailure(
          MissionFailureType.notFound,
          message: 'This mission is no longer available.',
        ),
        onRetry: onRetry,
      );
    }

    final theme = Theme.of(context);
    final progress = m.progress;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(m.definition.title, style: theme.textTheme.headlineSmall),
        if (m.definition.subtitle.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(m.definition.subtitle, style: theme.textTheme.bodyMedium),
        ],
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(label: Text('+${m.definition.xpReward} XP')),
            Chip(
              label: Text(
                '${progress.objectivesCompleted}/'
                '${progress.objectivesTotal} objectives',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Objectives', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final objective in m.objectives)
          MissionObjectiveItem(objective: objective),
        if (m.isCompleted) ...[
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.emoji_events_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text('Mission complete!', style: theme.textTheme.titleMedium),
            ],
          ),
        ],
      ],
    );
  }
}
