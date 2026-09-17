import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/domain/base_use_case.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';
import 'package:seedly_app/features/auth/applications/repository/auth_repository.dart';

class GoogleSignInUseCase implements UseCase<AuthSessionEntity> {
  const GoogleSignInUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<AuthSessionEntity>> call() =>
      _authRepository.signInWithGoogle();
}
