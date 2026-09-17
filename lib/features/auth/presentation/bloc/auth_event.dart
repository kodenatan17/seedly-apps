import 'package:equatable/equatable.dart';

// TODO: Add request-otp/verify-otp events once those usecases land.
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => const [];
}

/// User tapped "Sign in with Google".
final class GoogleSignInRequested extends AuthEvent {
  const GoogleSignInRequested();
}
