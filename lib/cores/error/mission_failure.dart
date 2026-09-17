import 'api_exception.dart';

/// User-presentable failure for the mission module.
///
/// Maps the backend error envelope to a stable enum so the UI never branches
/// on raw strings and never leaks server internals.
enum MissionFailureType {
  /// Network unreachable / timeout / transport not configured.
  network,

  /// 404 — mission not found or not owned by the current user.
  notFound,

  /// 401/403 — token expired or re-authentication required.
  unauthorized,

  /// 5xx — server-side failure.
  server,

  /// Anything unrecognised.
  unknown,
}

class MissionFailure implements Exception {
  const MissionFailure(this.type, {required this.message, this.code});

  final MissionFailureType type;

  /// Safe to display.
  final String message;

  /// Raw backend code, for logging only (never rendered).
  final String? code;

  /// Maps an [ApiException] to a display failure.
  factory MissionFailure.fromApi(ApiException e) => switch (e.code) {
        'not_found' => MissionFailure(
            MissionFailureType.notFound,
            message: 'This mission is no longer available.',
            code: e.code,
          ),
        'unauthorized' || 'unauthenticated' || 'token_expired' =>
          MissionFailure(
            MissionFailureType.unauthorized,
            message: 'Your session expired. Please sign in again.',
            code: e.code,
          ),
        'transport_unavailable' || 'network_error' || 'timeout' =>
          MissionFailure(
            MissionFailureType.network,
            message: 'No connection. Check your network and retry.',
            code: e.code,
          ),
        _ => MissionFailure(
            MissionFailureType.unknown,
            message: 'Something went wrong. Please try again.',
            code: e.code,
          ),
      };

  /// Safe display string.
  @override
  String toString() => 'MissionFailure($type): $message';
}
