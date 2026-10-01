import 'package:equatable/equatable.dart';

/// Events for resolving a seed/kit code — shared by
/// `garden_qr_scanner_screen.dart` (decoded QR payload) and
/// `garden_code_screen.dart` (typed code).
sealed class SeedResolveEvent extends Equatable {
  const SeedResolveEvent();

  @override
  List<Object?> get props => const [];
}

final class SeedCodeResolveRequested extends SeedResolveEvent {
  const SeedCodeResolveRequested(this.code);

  final String code;

  @override
  List<Object?> get props => [code];
}

/// Clears a previous error/result — dispatched when the user edits the code
/// field again or re-enters the scanner.
final class SeedResolveReset extends SeedResolveEvent {
  const SeedResolveReset();
}
