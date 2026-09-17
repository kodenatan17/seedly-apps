import 'package:flutter/material.dart';

import '../../applications/entities/mission_instance.dart';

/// Compact mission summary card used by the list, history, and the Garden Home
/// summary section (spec §18 — quests and missions are never merged into one
/// card).
class MissionCard extends StatelessWidget {
  const MissionCard({
    required this.mission,
    this.onTap,
    this.showCompletedAt = false,
    super.key,
  });

  final MissionInstance mission;
  final VoidCallback? onTap;
  final bool showCompletedAt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final done = mission.isCompleted;
    final progress = mission.progress;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      mission.definition.title,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  _XpBadge(
                    xp: mission.xpGranted?.amount ?? mission.definition.xpReward,
                    completed: done,
                  ),
                ],
              ),
              if (mission.definition.subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  mission.definition.subtitle,
                  style: theme.textTheme.bodySmall,
                ),
              ],
              const SizedBox(height: 12),
              if (done)
                Row(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      showCompletedAt
                          ? 'Completed ${_formatDate(mission.completedAt)}'
                          : 'Mission complete',
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                )
              else ...[
                Text(
                  '${progress.objectivesCompleted}/'
                  '${progress.objectivesTotal} objectives',
                  style: theme.textTheme.labelMedium,
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.ratio,
                    minHeight: 6,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime? date) {
    if (date == null) return '';
    final local = date.toLocal();
    final d = local.day.toString().padLeft(2, '0');
    final m = local.month.toString().padLeft(2, '0');
    return '$d/$m/${local.year}';
  }
}

class _XpBadge extends StatelessWidget {
  const _XpBadge({required this.xp, required this.completed});

  final int xp;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = completed
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSecondaryContainer;
    final bg = completed
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.secondaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '+$xp XP',
        style: theme.textTheme.labelMedium?.copyWith(color: fg),
      ),
    );
  }
}
