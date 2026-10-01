import 'package:equatable/equatable.dart';
import 'package:growpico_app/cores/domain/base_result_entity_helper.dart';
import 'package:growpico_app/cores/domain/base_use_case.dart';
import 'package:growpico_app/features/auth/applications/entities/auth_session_entities.dart';
import 'package:growpico_app/features/auth/applications/repository/auth_repository.dart';

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String email;
  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => [email, password, confirmPassword];
}

class RegisterUseCase
    implements UseCaseWithParams<RegisterParams, AuthSessionEntity> {
  const RegisterUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<AuthSessionEntity>> call(RegisterParams params) =>
      _authRepository.register(
        params.email,
        params.password,
        params.confirmPassword,
      );
}
