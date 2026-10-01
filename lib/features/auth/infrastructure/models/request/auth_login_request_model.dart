import 'package:json_annotation/json_annotation.dart';

part 'auth_login_request_model.g.dart';

/// POST /v1/account/auth/login (api_contracts_backend.md §1). camelCase.
@JsonSerializable()
class AuthLoginRequestModel {
  const AuthLoginRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  factory AuthLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginRequestModelToJson(this);
}
