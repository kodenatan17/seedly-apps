class BaseApis {
  static const String experienceMissionDetail = '/v1/me/missions/:id';

  static const String experienceMissionList = '/v1/me/missions';

  static const String experienceMissionHistory = '/v1/me/missions/history';

  static const String experienceAchievements = '/v1/me/achievements';

  static const String experiencePlantQuests = '/v1/plants/:id/quests';

  static const String experienceQuestSubmit =
      '/v1/plants/:id/quests/:questId/submit';

  static const String experienceQuestHistory = '/v1/plants/:id/quests/progress';

  static const String experiencePlantQuestions = '/v1/plants/:id/questions';

  static const String experienceQuestionAnswer =
      '/v1/plants/:id/questions/:questionId/answer';

  // --- Garden (api_contracts_backend.md §2) ---------------------------------
  // App-facing endpoints only. Endpoints authenticated with a device token /
  // `X-Signature` (device handshake, calibration-sample ingestion, telemetry
  // ingestion) are ESP32 firmware surfaces, not called by this app, and are
  // intentionally not modelled here.
  static const String gardenDeviceClaim = '/v1/garden/devices/claim';

  static const String gardenDeviceStatusBySerial =
      '/v1/garden/devices/status/:serial';

  static const String gardenDeviceDetail = '/v1/garden/devices/:id';

  static const String gardenDeviceCalibrationStart =
      '/v1/garden/devices/:id/calibration/start';

  static const String gardenDeviceCalibrationStatus =
      '/v1/garden/devices/:id/calibration';

  static const String gardenContainers = '/v1/garden/containers';

  static const String gardenContainerDetail = '/v1/garden/containers/:id';

  static const String gardenContainerEnvironment =
      '/v1/garden/containers/:id/environment';

  static const String gardenContainerPlantsStatus =
      '/v1/garden/containers/:id/plants/status';

  static const String gardenHome = '/v1/garden/home';

  static const String gardenSpecies = '/v1/garden/species';

  static const String gardenSeedsResolve = '/v1/garden/seeds/resolve';

  static const String gardenPlants = '/v1/garden/plants';

  static const String gardenPlantDetail = '/v1/garden/plants/:id';

  // NOTE: unversioned (no `/v1` prefix), matching the whitelist already
  // hardcoded in AuthorizationInterceptors — confirm with backend whether
  // these are genuinely unversioned before relying on it elsewhere.
  static const String authRequestOtp = '/auth/request-otp';

  static const String authSubmitOtp = '/auth/submit-otp';

  static const String authRefreshToken = '/auth/refresh-token';

  static const String authGoogleSignIn = '/auth/google-sign-in';

  static const String authDeleteAccount = '/auth/delete-account';

  static const String authLogout = '/auth/logout';

  static const String notificationRegisterToken =
      '/v1/notifications/register-token';

  static String get notificationStoreToken => null;
}
