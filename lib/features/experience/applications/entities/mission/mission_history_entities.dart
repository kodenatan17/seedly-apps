import 'package:equatable/equatable.dart';

class MissionHistoryEntity extends Equatable {
  final String id;
  final DefinitionHistoryEntity definition;
  final ScopeHistoryEntity scope;
  final String plantId;
  final String status;
  final String activedAt;
  final String? completedAt;
  final XpGrantHistoryEntity xpGranted;

  const MissionHistoryEntity({
    required this.id,
    required this.definition,
    required this.scope,
    required this.plantId,
    required this.status,
    required this.activedAt,
    this.completedAt,
    required this.xpGranted,
  });

  @override
  List<Object?> get props => [
    id,
    definition,
    scope,
    plantId,
    status,
    activedAt,
    completedAt,
    xpGranted,
  ];
}

class DefinitionHistoryEntity extends Equatable {
  final String key;
  final String title;
  final int xpReward;

  const DefinitionHistoryEntity({
    required this.key,
    required this.title,
    required this.xpReward,
  });

  @override
  List<Object?> get props => [key, title, xpReward];
}

class ScopeHistoryEntity extends Equatable {
  final String type;
  final String? plantId;

  const ScopeHistoryEntity({required this.type, this.plantId});

  @override
  List<Object?> get props => [type, plantId];
}

class XpGrantHistoryEntity extends Equatable {
  final String id;
  final int amount;
  final String grantedAt;

  const XpGrantHistoryEntity({
    required this.id,
    required this.amount,
    required this.grantedAt,
  });

  @override
  List<Object?> get props => [id, amount, grantedAt];
}