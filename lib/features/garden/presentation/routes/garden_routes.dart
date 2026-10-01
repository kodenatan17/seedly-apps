import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../cores/dependency/injection.dart';
import '../../../../l10n/l10n.dart';
import '../bloc/garden/garden_bloc.dart';
import '../bloc/plant_creation/plant_creation_bloc.dart';
import '../bloc/seed_resolve/seed_resolve_bloc.dart';
import '../bloc/species_catalogue/species_catalogue_bloc.dart';
import '../models/garden_seed_selection.dart';
import '../pages/garden_add_pot_screen.dart';
import '../pages/garden_add_pot_success_screen.dart';
import '../pages/garden_add_seed_success.dart';
import '../pages/garden_add_seeds_screen.dart';
import '../pages/garden_pot_add_detail_screen.dart';
import '../pages/garden_browse_catalogue_screen.dart';
import '../pages/garden_choose_container_screen.dart';
import '../pages/garden_code_screen.dart';
import '../pages/garden_qr_scanner_screen.dart';
import '../pages/garden_screen.dart';

/// Route paths owned by the Garden feature.
///
/// Nothing outside this file should hardcode a `/garden...` string.
abstract final class GardenRoutePaths {
  static const String root = '/garden';
  static const String addSeeds = '/garden/add-seeds';
  static const String scanQr = '/garden/add-seeds/scan';
  static const String enterCode = '/garden/add-seeds/code';
  static const String catalogue = '/garden/add-seeds/catalogue';
  static const String chooseContainer = '/garden/add-seeds/container';
  static const String success = '/garden/add-seeds/success';
  static const String addPot = '/garden/add-pot';
  static const String potDetail = '/garden/add-pot/detail';
  static const String potSuccess = '/garden/add-pot/success';
}

/// Pops when possible, otherwise falls back to the Garden landing screen so
/// previewing any of these routes as `initialLocation` never asserts on an
/// empty stack.
void _popOrGarden(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(GardenRoutePaths.root);
  }
}

/// Garden's route definitions — spread into the global router by the app
/// composition root, same as [missionRoutes]/[achievementRoutes]. Every bloc
/// is resolved via `getIt` (registered by [GardenModule.register] in
/// `di/garden_module.dart`); route builders never construct a repository or
/// use case directly.
List<RouteBase> gardenRoutes() => [
  GoRoute(
    path: GardenRoutePaths.root,
    builder: (context, state) => BlocProvider<GardenBloc>(
      create: (_) => getIt<GardenBloc>(),
      child: GardenScreen(
        onAddFirstPlant: () => context.push(GardenRoutePaths.addSeeds),
        onScanQr: () => context.push(GardenRoutePaths.scanQr),
      ),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.addSeeds,
    builder: (context, state) => GardenAddSeedsScreen(
      onBack: () => _popOrGarden(context),
      onClose: () => context.go(GardenRoutePaths.root),
      onScanQr: () => context.push(GardenRoutePaths.scanQr),
      onEnterCode: () => context.push(GardenRoutePaths.enterCode),
      onBrowseCatalogue: () => context.push(GardenRoutePaths.catalogue),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.scanQr,
    builder: (context, state) => BlocProvider<SeedResolveBloc>(
      create: (_) => getIt<SeedResolveBloc>(),
      child: GardenQrScannerScreen(
        onBack: () => _popOrGarden(context),
        onClose: () => context.go(GardenRoutePaths.root),
        onEnterCodeManually: () =>
            context.pushReplacement(GardenRoutePaths.enterCode),
        onCodeResolved: (resolved) => context.push(
          GardenRoutePaths.chooseContainer,
          extra: GardenSeedSelectionUiModel.fromSeedResolve(
            resolved,
            context.l10n,
          ),
        ),
      ),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.enterCode,
    builder: (context, state) => BlocProvider<SeedResolveBloc>(
      create: (_) => getIt<SeedResolveBloc>(),
      child: GardenCodeScreen(
        onBack: () => _popOrGarden(context),
        onClose: () => context.go(GardenRoutePaths.root),
        onCodeResolved: (resolved) => context.push(
          GardenRoutePaths.chooseContainer,
          extra: GardenSeedSelectionUiModel.fromSeedResolve(
            resolved,
            context.l10n,
          ),
        ),
      ),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.catalogue,
    builder: (context, state) => BlocProvider<SpeciesCatalogueBloc>(
      create: (_) => getIt<SpeciesCatalogueBloc>(),
      child: GardenBrowseCatalogueScreen(
        onBack: () => _popOrGarden(context),
        onSelectSpecies: (species) => context.push(
          GardenRoutePaths.chooseContainer,
          extra: GardenSeedSelectionUiModel.fromSpecies(species, context.l10n),
        ),
      ),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.chooseContainer,
    builder: (context, state) {
      final selection = state.extra as GardenSeedSelectionUiModel;
      return BlocProvider<PlantCreationBloc>(
        create: (_) => getIt<PlantCreationBloc>(),
        child: GardenChooseContainerScreen(
          selection: selection,
          onBack: () => _popOrGarden(context),
          onClose: () => context.go(GardenRoutePaths.root),
          onPlantCreated: (result) => context.pushReplacement(
            GardenRoutePaths.success,
            // Plant naming isn't part of the provided mockups yet — the
            // screen (and this route) default to the same placeholder name
            // used in the create-plant submission.
            extra: 'Tommy',
          ),
        ),
      );
    },
  ),
  GoRoute(
    path: GardenRoutePaths.addPot,
    builder: (context, state) => GardenAddPotScreen(
      onBack: () => _popOrGarden(context),
      onClose: () => context.go(GardenRoutePaths.root),
      onScanQr: () => context.push(GardenRoutePaths.potDetail),
      onEnterCode: () => context.push(GardenRoutePaths.potDetail),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.potDetail,
    builder: (context, state) => GardenPotAddDetailScreen(
      onBack: () => _popOrGarden(context),
      onClose: () => context.go(GardenRoutePaths.root),
      onConfirm: () => context.push(GardenRoutePaths.potSuccess),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.potSuccess,
    builder: (context, state) => GardenAddPotSuccessScreen(
      onClose: () => context.go(GardenRoutePaths.root),
      onConfirm: () => context.go(GardenRoutePaths.root),
    ),
  ),
  GoRoute(
    path: GardenRoutePaths.success,
    builder: (context, state) {
      final plantName = state.extra as String? ?? 'Tommy';
      return GardenAddSeedSuccessScreen(
        plantName: plantName,
        onClose: () => context.go(GardenRoutePaths.root),
        onGoToGarden: () => context.go(GardenRoutePaths.root),
      );
    },
  ),
];
