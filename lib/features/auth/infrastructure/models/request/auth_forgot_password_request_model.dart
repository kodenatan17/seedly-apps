import 'package:json_annotation/json_annotation.dart';

part 'auth_forgot_password_request_model.g.dart';

/// POST /v1/account/auth/forgot-password (api_contracts_backend.md §1).
@JsonSerializable()
class AuthForgotPasswordRequestModel {
  const AuthForgotPasswordRequestModel({required this.email});

  final String email;

  factory AuthForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthForgotPasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthForgotPasswordRequestModelToJson(this);
}
