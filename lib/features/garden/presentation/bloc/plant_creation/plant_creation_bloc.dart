import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../applications/usecases/create_plant_usecase.dart';
import '../../../applications/usecases/list_containers_usecase.dart';
import '../../models/container_slot_ui_model.dart';
import 'plant_creation_event.dart';
import 'plant_creation_state.dart';

/// Bloc backing `garden_choose_container_screen.dart`: loads containers,
/// tracks the selected Smart Pot, then submits `POST /v1/garden/plants`.
class PlantCreationBloc extends Bloc<PlantCreationEvent, PlantCreationState> {
  PlantCreationBloc({
    required ListContainersUseCase listContainers,
    required CreatePlantUseCase createPlant,
  }) : _listContainers = listContainers,
       _createPlant = createPlant,
       super(const PlantCreationState()) {
    on<PlantCreationContainersRequested>(_onContainersRequested);
    on<PlantCreationContainerSelected>(_onContainerSelected);
    on<PlantCreationSubmitted>(_onSubmitted);
  }

  final ListContainersUseCase _listContainers;
  final CreatePlantUseCase _createPlant;

  Future<void> _onContainersRequested(
    PlantCreationContainersRequested event,
    Emitter<PlantCreationState> emit,
  ) async {
    emit(const PlantCreationState());
    final result = await _listContainers();
    result.when(
      success: (success) {
        final slots = ContainerSlotUiModel.fromContainers(success.data);
        final preselected = _firstSelectable(slots)?.id;
        emit(
          PlantCreationState(
            status: PlantCreationStatus.ready,
            slots: slots,
            selectedContainerId: preselected,
          ),
        );
      },
      error: (error) => emit(
        PlantCreationState(
          status: PlantCreationStatus.error,
          errorMessage: error.message,
        ),
      ),
    );
  }

  void _onContainerSelected(
    PlantCreationContainerSelected event,
    Emitter<PlantCreationState> emit,
  ) {
    ContainerSlotUiModel? slot;
    for (final candidate in state.slots) {
      if (candidate.id == event.containerId) {
        slot = candidate;
        break;
      }
    }
    if (slot == null || !slot.isSelectable) return;
    emit(
      PlantCreationState(
        status: PlantCreationStatus.ready,
        slots: state.slots,
        selectedContainerId: event.containerId,
      ),
    );
  }

  Future<void> _onSubmitted(
    PlantCreationSubmitted event,
    Emitter<PlantCreationState> emit,
  ) async {
    final containerId = state.selectedContainerId;
    if (containerId == null) return;

    emit(
      PlantCreationState(
        status: PlantCreationStatus.submitting,
        slots: state.slots,
        selectedContainerId: containerId,
      ),
    );
    final result = await _createPlant(
      name: event.name,
      containerId: containerId,
      kitCode: event.selection.kitCode,
      speciesId: event.selection.speciesId,
    );
    result.when(
      success: (success) => emit(
        PlantCreationState(
          status: PlantCreationStatus.success,
          slots: state.slots,
          selectedContainerId: containerId,
          result: success.data,
        ),
      ),
      error: (error) => emit(
        PlantCreationState(
          status: PlantCreationStatus.error,
          slots: state.slots,
          selectedContainerId: containerId,
          errorMessage: error.message,
        ),
      ),
    );
  }

  ContainerSlotUiModel? _firstSelectable(List<ContainerSlotUiModel> slots) {
    for (final slot in slots) {
      if (slot.isSelectable) return slot;
    }
    return null;
  }
}
