import 'package:seedly_app/cores/domain/base_use_case.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/auth/applications/repository/auth_repository.dart';

// TODO: Implement once AuthRepository exposes a request-otp method.
class RequestOtpUseCase implements UseCaseWithParams<String, void> {
  const RequestOtpUseCase(this._authRepository);

  // ignore: unused_field
  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<void>> call(String phoneNumber) {
    throw UnimplementedError();
  }
}
