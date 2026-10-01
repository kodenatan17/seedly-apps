import 'package:equatable/equatable.dart';
import 'package:growpico_app/cores/domain/base_result_entity_helper.dart';
import 'package:growpico_app/cores/domain/base_use_case.dart';
import 'package:growpico_app/features/auth/applications/entities/auth_session_entities.dart';
import 'package:growpico_app/features/auth/applications/repository/auth_repository.dart';

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class LoginUseCase implements UseCaseWithParams<LoginParams, AuthSessionEntity> {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<AuthSessionEntity>> call(LoginParams params) =>
      _authRepository.login(params.email, params.password);
}
