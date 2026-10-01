import 'package:json_annotation/json_annotation.dart';

part 'auth_update_profile_request_model.g.dart';

/// PATCH /v1/account/profile (api_contracts_backend.md §1). camelCase.
@JsonSerializable()
class AuthUpdateProfileRequestModel {
  const AuthUpdateProfileRequestModel({required this.username});

  final String username;

  factory AuthUpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUpdateProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUpdateProfileRequestModelToJson(this);
}
