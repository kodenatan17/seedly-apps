import 'package:equatable/equatable.dart';

/// Domain profile shape from GET /v1/account/profile
/// (api_contracts_backend.md §1). Server-derived; never computed locally.
class ProfileEntity extends Equatable {
  const ProfileEntity({
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
  final List<ProfilePlantEntity> plants;

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    level,
    levelName,
    xp,
    streakDays,
    plants,
  ];
}

class ProfilePlantEntity extends Equatable {
  const ProfilePlantEntity({
    required this.iotId,
    required this.iotName,
    required this.currentSeeds,
    this.seeds = const [],
  });

  final String iotId;
  final String iotName;
  final int currentSeeds;
  final List<ProfileSeedEntity> seeds;

  @override
  List<Object?> get props => [iotId, iotName, currentSeeds, seeds];
}

class ProfileSeedEntity extends Equatable {
  const ProfileSeedEntity({
    required this.seedId,
    required this.seedName,
    required this.seedLatinName,
    required this.growthPercentage,
  });

  final String seedId;
  final String seedName;
  final String seedLatinName;
  final double growthPercentage;

  @override
  List<Object?> get props => [seedId, seedName, seedLatinName, growthPercentage];
}

/// Domain result of PATCH /v1/account/profile (api_contracts_backend.md §1).
class UpdateProfileResultEntity extends Equatable {
  const UpdateProfileResultEntity({required this.id, required this.username});

  final String id;
  final String username;

  @override
  List<Object?> get props => [id, username];
}
