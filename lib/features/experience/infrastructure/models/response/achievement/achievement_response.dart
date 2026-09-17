import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/achievement/achievement_entities.dart';

part 'achievement_response.g.dart';

@JsonSerializable()
class AchievementResponse implements ResponseMapper<AchievementEntity> {
  final String key;
  final String title;
  final String category;
  final int xpReward;
  final DateTime unlockedAt;

  const AchievementResponse({
    required this.key,
    required this.title,
    required this.category,
    required this.xpReward,
    required this.unlockedAt,
  });

  factory AchievementResponse.fromJson(Map<String, dynamic> json) =>
      _$AchievementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementResponseToJson(this);

  @override
  AchievementEntity toDomain() => AchievementEntity(
    key: key,
    title: title,
    category: category,
    xpReward: xpReward,
    unlockedAt: unlockedAt,
  );
}
