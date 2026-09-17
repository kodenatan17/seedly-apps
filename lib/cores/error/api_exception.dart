/// Transport-agnostic API failure.
///
/// `code` maps to the backend error envelope (`error.code`, api-contract §1.3)
/// so feature code can branch on stable machine codes rather than messages.
class ApiException implements Exception {
  const ApiException({required this.code, required this.message, this.details});

  final String code;
  final String message;
  final Map<String, dynamic>? details;

  @override
  String toString() => 'ApiException($code): $message';
}
