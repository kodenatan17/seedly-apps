import 'package:equatable/equatable.dart';

/// Unlocked achievement badge (`GET /v1/me/achievements`).
///
/// Discrete, one-time badges — a separate track from Progressive Mastery
/// (`/v1/me/mastery`), which is out of scope here (see
/// `garden-ai/solutioning/specs/contracts/api_contracts_backend.md` §10.1-10.3).
class AchievementEntity extends Equatable {
  const AchievementEntity({
    required this.key,
    required this.title,
    required this.category,
    required this.xpReward,
    required this.unlockedAt,
  });

  /// Stable machine id, e.g. `first_water`.
  final String key;
  final String title;

  /// One of `Growth|Care|Learning|Journey`.
  final String category;
  final int xpReward;
  final DateTime unlockedAt;

  @override
  List<Object?> get props => [key, title, category, xpReward, unlockedAt];
}
