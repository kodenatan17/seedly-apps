import 'package:flutter/material.dart';

import '../../applications/entities/mission_objective.dart';

/// One objective row with a labelled progress bar (spec §19 partial-completion
/// UX: per-objective bars + clear "what's left" copy, never a failure state).
class MissionObjectiveItem extends StatelessWidget {
  const MissionObjectiveItem({required this.objective, super.key});

  final MissionObjective objective;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final done = objective.isCompleted;
    final label = done
        ? '${objective.countRequired}/${objective.countRequired}'
        : '${objective.evidencedCount}/${objective.countRequired}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                done ? Icons.check_circle : Icons.radio_button_unchecked,
                size: 18,
                color: done
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  objective.title,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Text(label, style: theme.textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: objective.progress,
              minHeight: 6,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }
}
