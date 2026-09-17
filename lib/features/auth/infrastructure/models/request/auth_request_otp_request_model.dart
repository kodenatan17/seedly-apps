import 'package:json_annotation/json_annotation.dart';

part 'auth_request_otp_request_model.g.dart';

@JsonSerializable()
class AuthRequestOtpRequestModel {
  const AuthRequestOtpRequestModel({required this.phoneNumber});

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  factory AuthRequestOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestOtpRequestModelToJson(this);
}
