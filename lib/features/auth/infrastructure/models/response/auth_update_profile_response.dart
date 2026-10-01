import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_profile_entities.dart';

part 'auth_update_profile_response.g.dart';

/// PATCH /v1/account/profile (api_contracts_backend.md §1).
@JsonSerializable()
class AuthUpdateProfileResponse
    implements ResponseMapper<UpdateProfileResultEntity> {
  const AuthUpdateProfileResponse({required this.id, required this.username});

  final String id;
  final String username;

  factory AuthUpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUpdateProfileResponseToJson(this);

  @override
  UpdateProfileResultEntity toDomain() =>
      UpdateProfileResultEntity(id: id, username: username);
}
