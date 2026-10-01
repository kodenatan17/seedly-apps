import 'package:json_annotation/json_annotation.dart';

part 'auth_register_request_model.g.dart';

/// POST /v1/account/auth/register (api_contracts_backend.md §1). camelCase.
@JsonSerializable()
class AuthRegisterRequestModel {
  const AuthRegisterRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String email;
  final String password;
  final String confirmPassword;

  factory AuthRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRegisterRequestModelToJson(this);
}
