import 'package:json_annotation/json_annotation.dart';

part 'auth_google_sign_in_request_model.g.dart';

@JsonSerializable()
class AuthGoogleSignInRequestModel {
  const AuthGoogleSignInRequestModel({required this.idToken});

  @JsonKey(name: 'id_token')
  final String idToken;

  factory AuthGoogleSignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthGoogleSignInRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthGoogleSignInRequestModelToJson(this);
}
