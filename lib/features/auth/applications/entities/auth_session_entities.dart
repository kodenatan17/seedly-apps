import 'package:equatable/equatable.dart';

/// Domain shape of a logged-in session, produced by the login/OTP/Google
/// sign-in flow.
class AuthSessionEntity extends Equatable {
  const AuthSessionEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String? refreshToken;

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
