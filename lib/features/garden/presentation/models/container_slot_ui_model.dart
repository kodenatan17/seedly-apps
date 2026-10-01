import 'package:equatable/equatable.dart';

import '../../applications/entities/container/container_entities.dart';

/// A container presented as a selectable "Smart Pot" slot.
///
/// The API only returns `capacity`/`currentPlantCount`/`deviceId` — the
/// "Smart Pot A/B/C" label is presentation-only, assigned by list position
/// since the contract has no container nickname field.
class ContainerSlotUiModel extends Equatable {
  const ContainerSlotUiModel({
    required this.container,
    required this.label,
    required this.isSelectable,
  });

  /// Builds one slot per container, labelling them A, B, C, … by position.
  static List<ContainerSlotUiModel> fromContainers(
    List<ContainerEntity> containers,
  ) {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return [
      for (var i = 0; i < containers.length; i++)
        ContainerSlotUiModel(
          container: containers[i],
          label: letters[i % letters.length],
          isSelectable:
              containers[i].currentPlantCount < containers[i].capacity,
        ),
    ];
  }

  final ContainerEntity container;
  final String label;
  final bool isSelectable;

  String get id => container.id;

  @override
  List<Object?> get props => [container, label, isSelectable];
}
