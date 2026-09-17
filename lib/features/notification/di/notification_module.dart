import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import 'package:seedly_app/features/notification/applications/repositories/notification_repository.dart';
import 'package:seedly_app/features/notification/applications/usecases/notification_store_token_usecase.dart';
import 'package:seedly_app/features/notification/infrastructure/repositories/notification_repository_impl.dart';
import 'package:seedly_app/features/notification/infrastructure/services/dio/notification_ret_network_client.dart';
import 'package:seedly_app/features/notification/infrastructure/services/remote/notification_remote_service.dart';
import 'package:seedly_app/features/notification/presentation/cubit/notification_cubit.dart';

/// Module composition root.
///
/// Provides [NotificationModule.register] for wiring the feature's full
/// dependency graph (network client → remote service → repository →
/// usecase → cubit) into the application-level DI container
/// (`cores/dependency/injection.dart`), following the same manual
/// registration convention as `AuthModule`/`ExperienceModule`.
///
/// The `@injectable`/`@singleton` annotations elsewhere in this feature
/// (`NotificationCubit`, `NotificationStoreTokenUseCase`,
/// `NotificationRetApiDio`) are not wired to a generator yet — see the TODO
/// in `cores/dependency/injection.dart` — so they don't register anything on
/// their own; this is the code that actually runs.
class NotificationModule {
  const NotificationModule._();

  static void register({required GetIt getIt}) {
    if (!getIt.isRegistered<NotificationRetApiDio>()) {
      getIt.registerLazySingleton<NotificationRetApiDio>(
        () => NotificationRetApiDio(),
      );
    }
    if (!getIt.isRegistered<NotificationRemoteService>()) {
      getIt.registerLazySingleton<NotificationRemoteService>(
        () => NotificationRemoteService(getIt<NotificationRetApiDio>()),
      );
    }
    if (!getIt.isRegistered<BaseDioErrorHandler>()) {
      getIt.registerLazySingleton<BaseDioErrorHandler>(
        () => BaseDioErrorHandler(),
      );
    }
    if (!getIt.isRegistered<FirebaseMessaging>()) {
      getIt.registerLazySingleton<FirebaseMessaging>(
        () => FirebaseMessaging.instance,
      );
    }
    if (!getIt.isRegistered<FlutterLocalNotificationsPlugin>()) {
      getIt.registerLazySingleton<FlutterLocalNotificationsPlugin>(
        () => FlutterLocalNotificationsPlugin(),
      );
    }
    if (!getIt.isRegistered<NotificationRepository>()) {
      getIt.registerLazySingleton<NotificationRepository>(
        () => NotificationRepositoryImpl(
          getIt<NotificationRemoteService>(),
          getIt<FirebaseMessaging>(),
          getIt<BaseDioErrorHandler>(),
        ),
      );
    }
    if (!getIt.isRegistered<NotificationStoreTokenUseCase>()) {
      getIt.registerLazySingleton<NotificationStoreTokenUseCase>(
        () => NotificationStoreTokenUseCase(getIt<NotificationRepository>()),
      );
    }
    // Factory-registered, same convention as MissionBloc/AuthBloc — each
    // resolution gets a fresh cubit so its stream subscriptions follow the
    // consuming widget's lifecycle instead of leaking across screens.
    if (!getIt.isRegistered<NotificationCubit>()) {
      getIt.registerFactory<NotificationCubit>(
        () => NotificationCubit(getIt<FirebaseMessaging>()),
      );
    }
  }
}
