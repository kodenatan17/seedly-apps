import 'package:equatable/equatable.dart';

import '../../../applications/entities/species/species_entities.dart';

sealed class SpeciesCatalogueState extends Equatable {
  const SpeciesCatalogueState();

  @override
  List<Object?> get props => const [];
}

final class SpeciesCatalogueLoading extends SpeciesCatalogueState {
  const SpeciesCatalogueLoading();
}

final class SpeciesCatalogueLoaded extends SpeciesCatalogueState {
  const SpeciesCatalogueLoaded(this.species);

  final List<SpeciesEntity> species;

  @override
  List<Object?> get props => [species];
}

final class SpeciesCatalogueError extends SpeciesCatalogueState {
  const SpeciesCatalogueError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
