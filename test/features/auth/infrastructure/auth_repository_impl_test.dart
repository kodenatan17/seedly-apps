import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/cores/data/remote/response/boolean_only_remote_response.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_profile_entities.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';
import 'package:seedly_app/features/auth/infrastructure/datasources/auth_local_data_source.dart';
import 'package:seedly_app/features/auth/infrastructure/datasources/google_auth_data_source.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_forgot_password_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_login_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_register_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_update_profile_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_account_session_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_profile_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_update_profile_response.dart';
import 'package:seedly_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';
import 'package:seedly_app/features/auth/infrastructure/services/remote/auth_remote_service.dart';

class MockAuthRemoteService extends Mock implements AuthRemoteService {}

class MockGoogleAuthDataSource extends Mock implements GoogleAuthDataSource {}

class MockAuthSessionLocalDataSource extends Mock
    implements AuthSessionLocalDataSource {}

class MockBaseDioErrorHandler extends Mock implements BaseDioErrorHandler {}

void main() {
  late MockAuthRemoteService remote;
  late MockGoogleAuthDataSource google;
  late MockAuthSessionLocalDataSource local;
  late MockBaseDioErrorHandler dioErrorHandler;
  late AuthRepositoryImpl repo;

  BaseSuccessResponse<T> ok<T>(T data) =>
      BaseSuccessResponse<T>(data, Status(code: 200, message: 'Success'), null);

  setUp(() {
    remote = MockAuthRemoteService();
    google = MockGoogleAuthDataSource();
    local = MockAuthSessionLocalDataSource();
    dioErrorHandler = MockBaseDioErrorHandler();
    repo = AuthRepositoryImpl(remote, google, local, dioErrorHandler);
    registerFallbackValue('');
    registerFallbackValue(
      const AuthLoginRequestModel(email: '', password: ''),
    );
    registerFallbackValue(
      const AuthRegisterRequestModel(email: '', password: '', confirmPassword: ''),
    );
    registerFallbackValue(const AuthForgotPasswordRequestModel(email: ''));
    registerFallbackValue(const AuthUpdateProfileRequestModel(username: ''));
    registerFallbackValue(DioException(requestOptions: RequestOptions(path: '/')));
    when(
      local.setToken(
        accessToken: anyNamed('accessToken'),
        refreshToken: anyNamed('refreshToken'),
      ),
    ).thenAnswer((_) async {});
  });

  test('login success returns session and persists tokens', () async {
    when(
      remote.login(any, idempotencyKey: anyNamed('idempotencyKey')),
    ).thenAnswer(
      (_) async =>
          ok(const AccountAuthSessionResponse(accessToken: 'a', refreshToken: 'r')),
    );

    final result = await repo.login('e', 'p');

    expect(result, isA<ResultSuccess<AuthSessionEntity>>());
    expect(
      (result as ResultSuccess<AuthSessionEntity>).data,
      const AuthSessionEntity(accessToken: 'a', refreshToken: 'r'),
    );
    verify(local.setToken(accessToken: 'a', refreshToken: 'r')).called(1);
  });

  test('register success returns session and persists tokens', () async {
    when(
      remote.register(any, idempotencyKey: anyNamed('idempotencyKey')),
    ).thenAnswer(
      (_) async =>
          ok(const AccountAuthSessionResponse(accessToken: 'a', refreshToken: 'r')),
    );

    final result = await repo.register('e', 'p', 'p');

    expect(result, isA<ResultSuccess<AuthSessionEntity>>());
    expect(
      (result as ResultSuccess<AuthSessionEntity>).data,
      const AuthSessionEntity(accessToken: 'a', refreshToken: 'r'),
    );
    verify(local.setToken(accessToken: 'a', refreshToken: 'r')).called(1);
  });

  test('forgotPassword success returns true', () async {
    when(
      remote.forgotPassword(any, idempotencyKey: anyNamed('idempotencyKey')),
    ).thenAnswer((_) async => ok(BooleanOnlyRemoteResponse(true)));

    final result = await repo.forgotPassword('e');

    expect(result, isA<ResultSuccess<bool>>());
    expect((result as ResultSuccess<bool>).data, true);
  });

  test('getProfile maps nested plants and seeds', () async {
    when(remote.getProfile()).thenAnswer(
      (_) async => ok(
        const AuthProfileResponse(
          id: '1',
          username: 'u',
          email: 'e@x.com',
          level: 2,
          levelName: 'Sprout',
          xp: 10,
          streakDays: 3,
          plants: [
            ProfilePlantResponse(
              iotId: 'iot1',
              iotName: 'Pot',
              currentSeeds: 2,
              seeds: [
                ProfileSeedResponse(
                  seedId: 's1',
                  seedName: 'Basil',
                  seedLatinName: 'Ocimum',
                  growthPercentage: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    final result = await repo.getProfile();

    expect(result, isA<ResultSuccess<ProfileEntity>>());
    final profile = (result as ResultSuccess<ProfileEntity>).data;
    expect(profile.plants, hasLength(1));
    expect(profile.plants[0].seeds, hasLength(1));
    expect(profile.plants[0].seeds[0].seedId, 's1');
  });

  test('getProfile with empty plants returns empty list', () async {
    when(remote.getProfile()).thenAnswer(
      (_) async => ok(
        const AuthProfileResponse(
          id: '1',
          username: 'u',
          email: 'e@x.com',
          level: 1,
          levelName: 'Seed',
          xp: 0,
          streakDays: 0,
          plants: [],
        ),
      ),
    );

    final result = await repo.getProfile();

    expect(result, isA<ResultSuccess<ProfileEntity>>());
    expect((result as ResultSuccess<ProfileEntity>).data.plants, isEmpty);
  });

  test('updateProfile returns username', () async {
    when(
      remote.updateProfile(any, idempotencyKey: anyNamed('idempotencyKey')),
    ).thenAnswer(
      (_) async => ok(const AuthUpdateProfileResponse(id: '1', username: 'x')),
    );

    final result = await repo.updateProfile('x');

    expect(result, isA<ResultSuccess<UpdateProfileResultEntity>>());
    expect(
      (result as ResultSuccess<UpdateProfileResultEntity>).data,
      const UpdateProfileResultEntity(id: '1', username: 'x'),
    );
  });

  test('login DioException returns ResultError instead of throwing', () async {
    when(
      remote.login(any, idempotencyKey: anyNamed('idempotencyKey')),
    ).thenThrow(DioException(requestOptions: RequestOptions(path: '/x')));
    when(dioErrorHandler.handleDioError(any)).thenReturn(null);

    final result = await repo.login('e', 'p');

    expect(result, isA<ResultError<AuthSessionEntity>>());
  });

  test('request models keep camelCase json keys', () {
    expect(
      const AuthLoginRequestModel(email: 'e', password: 'p').toJson().keys
          .toSet(),
      {'email', 'password'},
    );
    expect(
      const AuthRegisterRequestModel(
        email: 'e',
        password: 'p',
        confirmPassword: 'p',
      ).toJson().containsKey('confirmPassword'),
      isTrue,
    );
    expect(
      const AccountAuthSessionResponse(
        accessToken: 'a',
        refreshToken: 'r',
      ).toJson().keys.toSet(),
      {'accessToken', 'refreshToken'},
    );
  });
}
