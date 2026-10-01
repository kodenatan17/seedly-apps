import 'package:json_annotation/json_annotation.dart';
import 'package:growpico_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:growpico_app/features/auth/applications/entities/auth_profile_entities.dart';

part 'auth_profile_response.g.dart';

/// GET /v1/account/profile (api_contracts_backend.md §1). camelCase.
/// plants/seeds nullable on the wire -> default empty list.
@JsonSerializable()
class AuthProfileResponse implements ResponseMapper<ProfileEntity> {
  const AuthProfileResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.level,
    required this.levelName,
    required this.xp,
    required this.streakDays,
    this.plants = const [],
  });

  final String id;
  final String username;
  final String email;
  final int level;
  final String levelName;
  final int xp;
  final int streakDays;
  final List<ProfilePlantResponse> plants;

  factory AuthProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthProfileResponseToJson(this);

  @override
  ProfileEntity toDomain() => ProfileEntity(
    id: id,
    username: username,
    email: email,
    level: level,
    levelName: levelName,
    xp: xp,
    streakDays: streakDays,
    plants: plants.map((e) => e.toDomain()).toList(),
  );
}

@JsonSerializable()
class ProfilePlantResponse implements ResponseMapper<ProfilePlantEntity> {
  const ProfilePlantResponse({
    required this.iotId,
    required this.iotName,
    required this.currentSeeds,
    this.seeds = const [],
  });

  final String iotId;
  final String iotName;
  final int currentSeeds;
  final List<ProfileSeedResponse> seeds;

  factory ProfilePlantResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfilePlantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePlantResponseToJson(this);

  @override
  ProfilePlantEntity toDomain() => ProfilePlantEntity(
    iotId: iotId,
    iotName: iotName,
    currentSeeds: currentSeeds,
    seeds: seeds.map((e) => e.toDomain()).toList(),
  );
}

@JsonSerializable()
class ProfileSeedResponse implements ResponseMapper<ProfileSeedEntity> {
  const ProfileSeedResponse({
    required this.seedId,
    required this.seedName,
    required this.seedLatinName,
    required this.growthPercentage,
  });

  final String seedId;
  final String seedName;
  final String seedLatinName;
  final double growthPercentage;

  factory ProfileSeedResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileSeedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileSeedResponseToJson(this);

  @override
  ProfileSeedEntity toDomain() => ProfileSeedEntity(
    seedId: seedId,
    seedName: seedName,
    seedLatinName: seedLatinName,
    growthPercentage: growthPercentage,
  );
}
