import 'package:seedly_app/cores/domain/base_use_case.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';
import 'package:seedly_app/features/auth/applications/repository/auth_repository.dart';

// TODO: Implement once AuthRepository exposes a submit-otp method.
class SubmitOtpUseCase
    implements UseCaseWithParams<SubmitOtpParams, AuthSessionEntity> {
  const SubmitOtpUseCase(this._authRepository);

  // ignore: unused_field
  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<AuthSessionEntity>> call(SubmitOtpParams params) {
    throw UnimplementedError();
  }
}

class SubmitOtpParams {
  const SubmitOtpParams({required this.phoneNumber, required this.otp});

  final String phoneNumber;
  final String otp;
}
