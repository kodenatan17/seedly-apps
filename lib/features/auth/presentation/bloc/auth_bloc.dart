import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growpico_app/features/auth/applications/usecases/google_sign_in_usecase.dart';
import 'package:growpico_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:growpico_app/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required GoogleSignInUseCase googleSignInUseCase})
    : _googleSignInUseCase = googleSignInUseCase,
      super(const AuthInitial()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
  }

  final GoogleSignInUseCase _googleSignInUseCase;

  Future<void> _onGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _googleSignInUseCase();
    result.when(
      success: (success) => emit(AuthSuccess(success.data)),
      error: (error) => emit(AuthFailure(error.message)),
    );
  }
}
