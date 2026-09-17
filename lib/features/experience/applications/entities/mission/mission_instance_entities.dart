import 'package:equatable/equatable.dart';

class MissionInstanceEntity extends Equatable {
  const MissionInstanceEntity({
    required this.id,
    required this.definition,
    required this.scope,
    required this.status,
    required this.activatedAt,
    this.completedAt,
    this.objectives = const [],
    this.progress = const MissionProgress(
      objectivesCompleted: 0,
      objectivesTotal: 0,
    ),
    this.xpGranted,
  });

  final String id;
  final MissionDefinition definition;
  final MissionScopeRef scope;
  final String status;
  final DateTime activatedAt;
  final DateTime? completedAt;

  /// Empty on the history list response (spec §14 keeps it compact).
  final List<MissionObjective> objectives;
  final MissionProgress progress;

  /// Present only on completed instances from `/history`.
  final XpGrant? xpGranted;

  @override
  List<Object?> get props => [
    id,
    definition,
    scope,
    status,
    activatedAt,
    completedAt,
    objectives,
    progress,
    xpGranted,
  ];
}

class MissionDefinition extends Equatable {
  const MissionDefinition({
    required this.key,
    required this.title,
    this.subtitle,
    required this.xpReward,
  });

  /// Stable machine id, e.g. `keep_plant_happy`.
  final String key;
  final String title;
  final String? subtitle;
  final int xpReward;

  @override
  List<Object?> get props => [key, title, subtitle, xpReward];
}

class MissionScopeRef extends Equatable {
  const MissionScopeRef({this.type, this.plantId, this.containerId});

  final String? type;
  final String? plantId;
  final String? containerId;

  @override
  List<Object?> get props => [type, plantId, containerId];
}

class MissionObjective extends Equatable {
  const MissionObjective({
    required this.key,
    required this.title,
    required this.sourceType,
    required this.countRequired,
    required this.evidencedCount,
    required this.status,
  });

  final String key;
  final String title;
  final String sourceType;
  final int countRequired;
  final int evidencedCount;
  final String status;

  @override
  List<Object?> get props => [
    key,
    title,
    sourceType,
    countRequired,
    evidencedCount,
    status,
  ];
}

class MissionProgress extends Equatable {
  const MissionProgress({
    required this.objectivesCompleted,
    required this.objectivesTotal,
  });

  final int objectivesCompleted;
  final int objectivesTotal;

  @override
  List<Object?> get props => [objectivesCompleted, objectivesTotal];
}

/// XP ledger reference attached to a completed mission (spec §14).
class XpGrant extends Equatable {
  const XpGrant({required this.xpEventId, required this.amount});

  final String xpEventId;
  final int amount;

  @override
  List<Object?> get props => [xpEventId, amount];
}
