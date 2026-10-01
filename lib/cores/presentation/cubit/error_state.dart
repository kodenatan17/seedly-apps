part of 'error_cubit.dart';

abstract class GlobalErrorState extends Equatable {
  const GlobalErrorState();
}

class ErrorIdle extends GlobalErrorState {
  @override
  List<Object?> get props => [];
}

class ErrorSnackbarState extends GlobalErrorState {
  final String? errorMessage;
  final ErrorTypeEnum errorType;
  final DateTime timestamp;

  ErrorSnackbarState(this.errorType, this.errorMessage)
      : timestamp = DateTime.now();

  @override
  List<Object?> get props => [errorType, errorMessage, timestamp];
}