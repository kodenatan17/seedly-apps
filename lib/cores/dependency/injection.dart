import 'package:get_it/get_it.dart';
import 'package:seedly_app/features/auth/di/auth_module.dart';
import 'package:seedly_app/features/experience/di/experience_module.dart';

/// The single, application-level DI container.
///
/// This is the one place DI is wired: Core registers its own shared/
/// cross-cutting capabilities here, and also registers every feature module
/// through that feature's own `di/*_module.dart` (e.g. [ExperienceModule]).
/// `main()` calls [registerCoreDependencies] once at startup — there is no
/// separate app-level composition file.
final GetIt getIt = GetIt.instance;

/// Registers every dependency the app needs: Core's own cross-cutting
/// capabilities (Auth, Network, Assessment, Navigation, FeatureFlag, etc.)
/// plus each feature module's dependency graph.
// TODO: Re-add @InjectableInit() (from package:injectable) once the
// injectable_generator build_runner step is wired up and injection.config.dart
// is generated. Until then the annotation has no generated part to attach to.
void registerCoreDependencies() {
  AuthModule.register(getIt: getIt);
  ExperienceModule.register(getIt: getIt);

  // TODO: Register NetworkClient when the Dio/http client lands.
  // getIt.registerSingleton<NetworkClient>(DioNetworkClient(dio));
  //
  // TODO: Register AssessmentService when the Assessment feature is built.
  // getIt.registerSingleton<AssessmentService>(AssessmentServiceImpl());
}
