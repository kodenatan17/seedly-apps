import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/mission_bloc.dart';
import '../bloc/mission_event.dart';
import '../bloc/mission_state.dart';
import '../widgets/mission_card.dart';
import '../widgets/mission_error_view.dart';

/// Mission list screen (spec §18 / decision D5: dedicated career area).
///
/// Route entry point — exported by `public_api.dart`. Re-triggers the list
/// load on entry so a returning back-navigation clears any transient detail
/// state (e.g. [MissionDetailLoaded]) instead of leaving a stale spinner.
class MissionListScreen extends StatefulWidget {
  const MissionListScreen({
    this.onMissionSelected,
    this.onOpenHistory,
    super.key,
  });

  /// Host-supplied navigation callback (deep-link safe); the screen itself
  /// never imports `go_router`, keeping the module boundary clean.
  final void Function(String missionId)? onMissionSelected;
  final VoidCallback? onOpenHistory;

  @override
  State<MissionListScreen> createState() => _MissionListScreenState();
}

class _MissionListScreenState extends State<MissionListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MissionBloc>().add(const MissionRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missions'),
        actions: [
          if (widget.onOpenHistory != null)
            IconButton(
              icon: const Icon(Icons.history),
              tooltip: 'Mission history',
              onPressed: widget.onOpenHistory,
            ),
        ],
      ),
      body: BlocBuilder<MissionBloc, MissionState>(
        builder: (context, state) {
          return switch (state) {
            MissionLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MissionError(:final failure) => MissionErrorView(
                failure: failure,
                onRetry: () =>
                    context.read<MissionBloc>().add(const MissionRefreshed()),
              ),
            MissionLoaded(:final missions) => RefreshIndicator(
                onRefresh: () async {
                  context.read<MissionBloc>().add(const MissionRefreshed());
                },
                child: missions.isEmpty
                    ? const _EmptyState()
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: missions.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final mission = missions[index];
                          return MissionCard(
                            mission: mission,
                            onTap: widget.onMissionSelected == null
                                ? null
                                : () => widget.onMissionSelected!(mission.id),
                          );
                        },
                      ),
              ),
            // Detail state is transient — it only lives while the detail
            // screen is on top; when it surfaces on the list route, the
            // initState dispatch above repopulates the list on the next frame.
            MissionDetailLoaded() => const Center(
                child: CircularProgressIndicator(),
              ),
          };
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    // ListView so pull-to-refresh still works on an empty list.
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Icon(
                Icons.flag_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 12),
              const Text('No missions yet. Keep caring for your plants.'),
            ],
          ),
        ),
      ],
    );
  }
}
