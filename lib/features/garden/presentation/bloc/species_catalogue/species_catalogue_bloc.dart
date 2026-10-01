import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../applications/usecases/list_species_usecase.dart';
import 'species_catalogue_event.dart';
import 'species_catalogue_state.dart';

/// Bloc backing `garden_browse_catalogue_screen.dart`.
class SpeciesCatalogueBloc
    extends Bloc<SpeciesCatalogueEvent, SpeciesCatalogueState> {
  SpeciesCatalogueBloc({required ListSpeciesUseCase listSpecies})
    : _listSpecies = listSpecies,
      super(const SpeciesCatalogueLoading()) {
    on<SpeciesCatalogueRequested>(_onRequested);
  }

  final ListSpeciesUseCase _listSpecies;

  Future<void> _onRequested(
    SpeciesCatalogueEvent event,
    Emitter<SpeciesCatalogueState> emit,
  ) async {
    emit(const SpeciesCatalogueLoading());
    final result = await _listSpecies();
    result.when(
      success: (success) => emit(SpeciesCatalogueLoaded(success.data)),
      error: (error) => emit(SpeciesCatalogueError(error.message)),
    );
  }
}
