import 'package:json_annotation/json_annotation.dart';

part 'auth_submit_otp_request_model.g.dart';

@JsonSerializable()
class AuthSubmitOtpRequestModel {
  const AuthSubmitOtpRequestModel({
    required this.phoneNumber,
    required this.otp,
  });

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  final String otp;

  factory AuthSubmitOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSubmitOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSubmitOtpRequestModelToJson(this);
}
