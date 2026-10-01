import 'package:growpico_app/cores/domain/base_result_entity_helper.dart';
import 'package:growpico_app/cores/domain/base_use_case.dart';
import 'package:growpico_app/features/auth/applications/entities/auth_profile_entities.dart';
import 'package:growpico_app/features/auth/applications/repository/auth_repository.dart';

class UpdateProfileUseCase
    implements UseCaseWithParams<String, UpdateProfileResultEntity> {
  const UpdateProfileUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<ResultEntity<UpdateProfileResultEntity>> call(String params) =>
      _authRepository.updateProfile(params);
}
