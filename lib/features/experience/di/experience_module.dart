import 'package:get_it/get_it.dart';

import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import '../applications/repository/experience_repository.dart';
import '../applications/usecases/get_mission_detail_usecase.dart';
import '../applications/usecases/get_mission_history_usecase.dart';
import '../applications/usecases/get_missions_usecase.dart';
import '../infrastructure/datasources/experience_remote_data_source.dart';
import '../infrastructure/repositories/experience_repository_impl.dart';
import '../infrastructure/services/dio/experience_ret_network_client.dart';
import '../infrastructure/services/remote/experience_remote_service.dart';
import '../presentation/bloc/mission_bloc.dart';
import '../presentation/bloc/mission_history_bloc.dart';

/// Module composition root.
///
/// Provides [ExperienceModule.register] for wiring the feature's full
/// dependency graph (network client → remote service → data source →
/// repository → use cases → blocs) into the application-level DI container
/// (`cores/dependency/injection.dart`). Nothing inside the module reaches
/// outside its own folder except `cores/`.
class ExperienceModule {
  const ExperienceModule._();

  /// Registers feature-specific dependencies into the global DI container.
  static void register({required GetIt getIt}) {
    if (!getIt.isRegistered<ExperienceRetApiDio>()) {
      getIt.registerLazySingleton<ExperienceRetApiDio>(
        () => ExperienceRetApiDio(),
      );
    }
    if (!getIt.isRegistered<ExperienceRemoteService>()) {
      getIt.registerLazySingleton<ExperienceRemoteService>(
        () => ExperienceRemoteService(getIt<ExperienceRetApiDio>()),
      );
    }
    if (!getIt.isRegistered<ExperienceRemoteDataSource>()) {
      getIt.registerLazySingleton<ExperienceRemoteDataSource>(
        () =>
            ExperienceRemoteDataSourceImpl(getIt<ExperienceRemoteService>()),
      );
    }
    if (!getIt.isRegistered<BaseDioErrorHandler>()) {
      getIt.registerLazySingleton<BaseDioErrorHandler>(
        () => BaseDioErrorHandler(),
      );
    }
    if (!getIt.isRegistered<ExperienceRepository>()) {
      getIt.registerLazySingleton<ExperienceRepository>(
        () => ExperienceRepositoryImpl(
          getIt<ExperienceRemoteDataSource>(),
          getIt<BaseDioErrorHandler>(),
        ),
      );
    }
    if (!getIt.isRegistered<GetMissionsUseCase>()) {
      getIt.registerLazySingleton(
        () => GetMissionsUseCase(getIt<ExperienceRepository>()),
      );
    }
    if (!getIt.isRegistered<GetMissionDetailUseCase>()) {
      getIt.registerLazySingleton(
        () => GetMissionDetailUseCase(getIt<ExperienceRepository>()),
      );
    }
    if (!getIt.isRegistered<GetMissionHistoryUseCase>()) {
      getIt.registerLazySingleton(
        () => GetMissionHistoryUseCase(getIt<ExperienceRepository>()),
      );
    }

    // Blocs: factory-registered (fresh instance per resolution) so each route
    // push owns its own bloc lifecycle. Route builders in
    // `presentation/routes/mission_routes.dart` resolve these via `getIt`
    // instead of constructing use cases/repositories by hand.
    if (!getIt.isRegistered<MissionBloc>()) {
      getIt.registerFactory<MissionBloc>(
        () => MissionBloc(
          getMissions: getIt<GetMissionsUseCase>(),
          getMissionDetail: getIt<GetMissionDetailUseCase>(),
        ),
      );
    }
    if (!getIt.isRegistered<MissionHistoryBloc>()) {
      getIt.registerFactory<MissionHistoryBloc>(
        () => MissionHistoryBloc(getHistory: getIt<GetMissionHistoryUseCase>()),
      );
    }
  }
}

/// Reusable use-case bundle for host-owned screens (e.g. the Garden Home
/// summary card) that want mission data without the mission screens.
///
/// Build via `getIt`, e.g. `MissionUseCases(getMissions: getIt(), ...)`,
/// once [ExperienceModule.register] has run.
class MissionUseCases {
  const MissionUseCases({
    required this.getMissions,
    required this.getMissionDetail,
    required this.getMissionHistory,
  });

  final GetMissionsUseCase getMissions;
  final GetMissionDetailUseCase getMissionDetail;
  final GetMissionHistoryUseCase getMissionHistory;
}
