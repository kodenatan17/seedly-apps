import 'package:equatable/equatable.dart';

/// Events for `garden_browse_catalogue_screen.dart`.
sealed class SpeciesCatalogueEvent extends Equatable {
  const SpeciesCatalogueEvent();

  @override
  List<Object?> get props => const [];
}

final class SpeciesCatalogueRequested extends SpeciesCatalogueEvent {
  const SpeciesCatalogueRequested();
}
