import 'package:equatable/equatable.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';

// TODO: Add request-otp/verify-otp states once those usecases land.
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => const [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSuccess extends AuthState {
  const AuthSuccess(this.session);

  final AuthSessionEntity session;

  @override
  List<Object?> get props => [session];
}

final class AuthFailure extends AuthState {
  const AuthFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
