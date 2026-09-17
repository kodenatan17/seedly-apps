import 'package:equatable/equatable.dart';

/// Completed quest entry (`GET /v1/plants/:id/quests/progress`).
class QuestHistoryEntity extends Equatable {
  const QuestHistoryEntity({
    required this.questId,
    required this.key,
    required this.type,
    required this.status,
    required this.completedAt,
    required this.xpAwarded,
  });

  final String questId;
  final String key;
  final String type;
  final String status;
  final DateTime completedAt;
  final int xpAwarded;

  @override
  List<Object?> get props => [
    questId,
    key,
    type,
    status,
    completedAt,
    xpAwarded,
  ];
}
