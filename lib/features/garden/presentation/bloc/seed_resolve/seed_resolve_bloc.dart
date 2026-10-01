import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../applications/usecases/resolve_seed_code_usecase.dart';
import 'seed_resolve_event.dart';
import 'seed_resolve_state.dart';

/// Bloc shared by `garden_qr_scanner_screen.dart` and
/// `garden_code_screen.dart` — both surfaces resolve to the same
/// `POST /v1/garden/seeds/resolve` call.
class SeedResolveBloc extends Bloc<SeedResolveEvent, SeedResolveState> {
  SeedResolveBloc({required ResolveSeedCodeUseCase resolveSeedCode})
    : _resolveSeedCode = resolveSeedCode,
      super(const SeedResolveInitial()) {
    on<SeedCodeResolveRequested>(_onResolveRequested);
    on<SeedResolveReset>((event, emit) => emit(const SeedResolveInitial()));
  }

  final ResolveSeedCodeUseCase _resolveSeedCode;

  Future<void> _onResolveRequested(
    SeedCodeResolveRequested event,
    Emitter<SeedResolveState> emit,
  ) async {
    emit(const SeedResolveLoading());
    final result = await _resolveSeedCode(event.code);
    result.when(
      success: (success) => emit(SeedResolveSuccess(success.data)),
      error: (error) => emit(SeedResolveError(error.message)),
    );
  }
}
