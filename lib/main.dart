
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:seedly_app/atomic/theme/app_theme.dart';
import 'package:seedly_app/cores/env/env.dart';
import 'package:seedly_app/cores/globals.dart';
import 'package:seedly_app/cores/presentation/cubit/error_cubit.dart';
import 'package:seedly_app/cores/presentation/cubit/internet_connection_cubit.dart';
import 'package:seedly_app/cores/router/app_router.dart';
import 'package:seedly_app/features/auth/presentation/routes/auth_routes.dart';
import 'package:seedly_app/features/experience/presentation/routes/achievement_routes.dart';
import 'package:seedly_app/features/experience/presentation/routes/mission_routes.dart';
import 'package:seedly_app/features/garden/presentation/routes/garden_routes.dart';
import 'package:seedly_app/cores/presentation/error_enum.dart';
import 'package:seedly_app/cores/presentation/error_stream.dart';
import 'package:seedly_app/features/notification/presentation/notification_handle_background.dart';
import 'package:seedly_app/firebase_options.dart';
import 'package:seedly_app/l10n/generated/app_localizations.dart';

import 'cores/dependency/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await BaseEnvirontment().initEnv();
  await BaseEnvirontment().initFirebaseEnv();
  await BaseEnvirontment().getCurrentEnv();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerCoreDependencies();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const SeedlyApp());
}

class SeedlyApp extends StatefulWidget {
  const SeedlyApp({super.key});

  @override
  State<SeedlyApp> createState() => _SeedlyAppState();
}

class _SeedlyAppState extends State<SeedlyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // NotificationCubit(FlutterLocalNotificationsPlugin(), FirebaseMessaging.instance).init(context);

    getIt<InternetConnectionCubit>().init();
    globalErrorStreamController.stream.listen((event) {
      globalErrorEventMapper(event);
    });
  }

  @override
  void dispose() {
    getIt<InternetConnectionCubit>().stopStream();
    globalErrorStreamController.close();
    super.dispose();
  }

  void globalErrorEventMapper(ErrorEvent event) {
    final context = AppGlobals.navigatorKey.currentContext;
    if (context == null) return;
    switch (event.type) {
      case ErrorTypeEnum.noInternet:
        context.read<GlobalErrorCubit>().showSnackbar(
          errorType: event.type,
          errorMessage: event.message,
        );
      case ErrorTypeEnum.pageNotFound:
      case ErrorTypeEnum.somethingWrong:
      case ErrorTypeEnum.serverError:
      case ErrorTypeEnum.forbidden:
      case ErrorTypeEnum.unauthorized:
      case ErrorTypeEnum.internetConnected:
        context.read<GlobalErrorCubit>().showSnackbar(
          errorType: event.type,
          errorMessage: event.message,
        );
    }
  }

  final GoRouter _router = buildAppRouter(
    initialLocation: MissionRoutePaths.list,
    routes: [
      ...authRoutes(),
      ...missionRoutes(),
      ...achievementRoutes(),
      ...gardenRoutes(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalErrorCubit>(
      create: (_) => GlobalErrorCubit(),
      child: MaterialApp.router(
        title: 'Seedly',
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationHandleBackground.handleNotif(message);
}
