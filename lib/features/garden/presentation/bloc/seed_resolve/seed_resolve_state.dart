import 'package:equatable/equatable.dart';

import '../../../applications/entities/seed/seed_entities.dart';

sealed class SeedResolveState extends Equatable {
  const SeedResolveState();

  @override
  List<Object?> get props => const [];
}

final class SeedResolveInitial extends SeedResolveState {
  const SeedResolveInitial();
}

final class SeedResolveLoading extends SeedResolveState {
  const SeedResolveLoading();
}

final class SeedResolveSuccess extends SeedResolveState {
  const SeedResolveSuccess(this.resolved);

  final SeedResolveEntity resolved;

  @override
  List<Object?> get props => [resolved];
}

final class SeedResolveError extends SeedResolveState {
  const SeedResolveError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
