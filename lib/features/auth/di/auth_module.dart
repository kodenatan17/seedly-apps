import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seedly_app/cores/domain/auth_local_data_source.dart';
import 'package:seedly_app/cores/domain/auth_token_refresher.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import 'package:seedly_app/features/auth/applications/repository/auth_repository.dart';
import 'package:seedly_app/features/auth/applications/usecases/google_sign_in_usecase.dart';
import 'package:seedly_app/features/auth/infrastructure/datasources/auth_local_data_source.dart';
import 'package:seedly_app/features/auth/infrastructure/datasources/google_auth_data_source.dart';
import 'package:seedly_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';
import 'package:seedly_app/features/auth/infrastructure/repositories/auth_token_refresher_impl.dart';
import 'package:seedly_app/features/auth/infrastructure/services/dio/auth_api_dio.dart';
import 'package:seedly_app/features/auth/infrastructure/services/remote/auth_remote_service.dart';
import 'package:seedly_app/features/auth/presentation/bloc/auth_bloc.dart';

/// Module composition root.
///
/// Provides [AuthModule.register] for wiring Auth's dependency graph into
/// the application-level DI container (`cores/dependency/injection.dart`).
/// Nothing inside the module reaches outside its own folder except `cores/`.
///
/// This is also where `cores/domain/auth_local_data_source.dart` and
/// `auth_token_refresher.dart` — the two abstract contracts cores/services
/// depends on — get bound to their concrete implementations. That keeps the
/// dependency direction one-way: cores never imports a concrete Auth class,
/// only these interfaces, and only this module (reached solely through the
/// composition root, exactly like [ExperienceModule]) knows about both sides.
class AuthModule {
  const AuthModule._();

  static void register({required GetIt getIt}) {
    if (!getIt.isRegistered<AuthApiDio>()) {
      getIt.registerLazySingleton<AuthApiDio>(() => AuthApiDio());
    }
    if (!getIt.isRegistered<AuthRemoteService>()) {
      getIt.registerLazySingleton<AuthRemoteService>(
        () => AuthRemoteService(getIt<AuthApiDio>()),
      );
    }
    if (!getIt.isRegistered<AuthSessionLocalDataSource>()) {
      getIt.registerLazySingleton<AuthSessionLocalDataSource>(
        () => const AuthLocalDataSourceImpl(FlutterSecureStorage()),
      );
    }
    // Alias: cores/services/interceptors resolve getIt<AuthLocalDataSource>()
    // and must get the same singleton registered above under the richer
    // feature-level type.
    if (!getIt.isRegistered<AuthLocalDataSource>()) {
      getIt.registerLazySingleton<AuthLocalDataSource>(
        () => getIt<AuthSessionLocalDataSource>(),
      );
    }
    if (!getIt.isRegistered<AuthTokenRefresher>()) {
      getIt.registerLazySingleton<AuthTokenRefresher>(
        () => AuthTokenRefresherImpl(getIt<AuthRemoteService>()),
      );
    }
    if (!getIt.isRegistered<BaseDioErrorHandler>()) {
      getIt.registerLazySingleton<BaseDioErrorHandler>(
        () => BaseDioErrorHandler(),
      );
    }
    if (!getIt.isRegistered<GoogleSignIn>()) {
      getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
    }
    if (!getIt.isRegistered<GoogleAuthDataSource>()) {
      getIt.registerLazySingleton<GoogleAuthDataSource>(
        () => GoogleAuthDataSourceImpl(getIt<GoogleSignIn>()),
      );
    }
    if (!getIt.isRegistered<AuthRepository>()) {
      getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
          getIt<AuthRemoteService>(),
          getIt<GoogleAuthDataSource>(),
          getIt<AuthSessionLocalDataSource>(),
          getIt<BaseDioErrorHandler>(),
        ),
      );
    }
    if (!getIt.isRegistered<GoogleSignInUseCase>()) {
      getIt.registerLazySingleton<GoogleSignInUseCase>(
        () => GoogleSignInUseCase(getIt<AuthRepository>()),
      );
    }
    // Blocs: factory-registered (fresh instance per resolution), same
    // convention as MissionBloc in ExperienceModule.
    if (!getIt.isRegistered<AuthBloc>()) {
      getIt.registerFactory<AuthBloc>(
        () => AuthBloc(googleSignInUseCase: getIt<GoogleSignInUseCase>()),
      );
    }
    // Future: request-otp/submit-otp usecases slot in here exactly like
    // GoogleSignInUseCase above — no cores/ changes required when that lands.
  }
}
