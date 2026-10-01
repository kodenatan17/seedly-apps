import 'package:equatable/equatable.dart';

import '../../../applications/entities/plant/plant_entities.dart';
import '../../models/container_slot_ui_model.dart';

enum PlantCreationStatus { loading, ready, submitting, success, error }

/// Single state object (rather than a sealed hierarchy) because the
/// container grid must stay on screen through submission and through a
/// submit error — only the [status] flag changes to drive the button's
/// loading spinner / an inline error message.
class PlantCreationState extends Equatable {
  const PlantCreationState({
    this.status = PlantCreationStatus.loading,
    this.slots = const [],
    this.selectedContainerId,
    this.result,
    this.errorMessage,
  });

  final PlantCreationStatus status;
  final List<ContainerSlotUiModel> slots;
  final String? selectedContainerId;
  final PlantCreateResultEntity? result;
  final String? errorMessage;

  bool get canSubmit =>
      status != PlantCreationStatus.submitting && selectedContainerId != null;

  @override
  List<Object?> get props => [
    status,
    slots,
    selectedContainerId,
    result,
    errorMessage,
  ];
}
