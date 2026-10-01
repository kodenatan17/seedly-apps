import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../applications/usecases/list_containers_usecase.dart';
import 'garden_event.dart';
import 'garden_state.dart';

/// Bloc backing `garden_screen.dart`.
///
/// "Empty" is derived client-side: no containers, or every container's
/// `currentPlantCount` is `0` — the Garden Home aggregate
/// (`GET /v1/garden/home`) is a broader dashboard not needed for this
/// screen's empty-state framing, so this reads containers directly.
class GardenBloc extends Bloc<GardenEvent, GardenState> {
  GardenBloc({required ListContainersUseCase listContainers})
    : _listContainers = listContainers,
      super(const GardenLoading()) {
    on<GardenRequested>(_onRequested);
    on<GardenRefreshed>(_onRequested);
  }

  final ListContainersUseCase _listContainers;

  Future<void> _onRequested(
    GardenEvent event,
    Emitter<GardenState> emit,
  ) async {
    emit(const GardenLoading());
    final result = await _listContainers();
    result.when(
      success: (success) {
        final containers = success.data;
        final totalPlants = containers.fold<int>(
          0,
          (sum, container) => sum + container.currentPlantCount,
        );
        emit(
          totalPlants == 0
              ? const GardenEmpty()
              : GardenLoaded(containers: containers, totalPlants: totalPlants),
        );
      },
      error: (error) => emit(GardenError(error.message)),
    );
  }
}
