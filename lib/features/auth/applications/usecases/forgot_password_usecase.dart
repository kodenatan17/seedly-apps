import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/domain/base_use_case.dart';
import 'package:seedly_app/features/auth/applications/repository/auth_repository.dart';

class ForgotPasswordUseCase implements UseCaseWithParams<String, bool> {
  const ForgotPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<bool>> call(String params) =>
      _authRepository.forgotPassword(params);
}
