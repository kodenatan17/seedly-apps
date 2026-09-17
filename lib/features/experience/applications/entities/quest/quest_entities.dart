import 'package:equatable/equatable.dart';

/// Active plant quest (`GET /v1/plants/:id/quests`).
class QuestEntity extends Equatable {
  const QuestEntity({
    required this.questId,
    required this.key,
    required this.type,
    required this.title,
    required this.verification,
    required this.xpReward,
    required this.progress,
    required this.requiredCount,
    required this.status,
  });

  final String questId;

  /// Stable machine id, e.g. `water_the_plant`.
  final String key;

  /// One of `CARE|WATERING|OBSERVATION|LEARNING|GROWTH_CHECK|ENVIRONMENT`.
  final String type;
  final String title;

  /// One of `BUTTON|SENSOR|GROWTH_REPORT|QUESTION`.
  final String verification;
  final int xpReward;
  final int progress;
  final int requiredCount;

  /// One of `PENDING|COMPLETED|PARTIALLY_COMPLETED|FAILED|NOT_APPLICABLE|EXPIRED`.
  final String status;

  @override
  List<Object?> get props => [
    questId,
    key,
    type,
    title,
    verification,
    xpReward,
    progress,
    requiredCount,
    status,
  ];
}

/// Result of submitting a button-verified quest
/// (`POST /v1/plants/:id/quests/:questId/submit`).
class QuestSubmitResultEntity extends Equatable {
  const QuestSubmitResultEntity({
    required this.questId,
    required this.status,
    required this.xpAwarded,
  });

  final String questId;

  /// `COMPLETED` or `PARTIALLY_COMPLETED`.
  final String status;
  final int xpAwarded;

  @override
  List<Object?> get props => [questId, status, xpAwarded];
}
