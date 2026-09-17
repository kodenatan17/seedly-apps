class BaseApis {
  static const String experienceMissionDetail = '/v1/me/missions/:id';

  static const String experienceMissionList = '/v1/me/missions';

  static const String experienceMissionHistory = '/v1/me/missions/history';

  // NOTE: unversioned (no `/v1` prefix), matching the whitelist already
  // hardcoded in AuthorizationInterceptors — confirm with backend whether
  // these are genuinely unversioned before relying on it elsewhere.
  static const String authRequestOtp = '/auth/request-otp';

  static const String authSubmitOtp = '/auth/submit-otp';

  static const String authRefreshToken = '/auth/refresh-token';

  static const String authGoogleSignIn = '/auth/google-sign-in';

  static const String authDeleteAccount = '/auth/delete-account';

  static const String authLogout = '/auth/logout';
}
