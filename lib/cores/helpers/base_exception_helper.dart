import 'package:equatable/equatable.dart';

abstract class BaseExceptionHelper extends Equatable implements Exception {
  final String message;

  const BaseExceptionHelper(this.message);

  @override
  List<Object?> get props => [message];
}

class CacheException extends BaseExceptionHelper {
  const CacheException() : super("ERR_CACHE_EXCEPTION");
}