import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/presentation/error_enum.dart';

part 'error_state.dart';

const _defaultErrorMessage = 'Something Went Wrong';



@lazySingleton
class GlobalErrorCubit extends Cubit<GlobalErrorState> {
  GlobalErrorCubit() : super(ErrorIdle());

  void showSnackbar({
    required ErrorTypeEnum errorType,
    String? errorMessage,
  }) {
    emit(ErrorSnackbarState(errorType, _resolveErrorMessage(errorMessage)));
  }

  /// Show a snackbar with a message that bypasses the passthrough filter.
  /// Use this for non-error informational messages (e.g. resend success).
  void showInfoSnackbar({
    required ErrorTypeEnum errorType,
    required String message,
  }) {
    emit(ErrorSnackbarState(errorType, message));
  }

  void reset() => emit(ErrorIdle());

  String _resolveErrorMessage(String? errorMessage) {
    if (errorMessage == null) {
      return _defaultErrorMessage;
    }

    final normalizedMessage = errorMessage.trim();
    if (normalizedMessage.isEmpty) {
      return _defaultErrorMessage;
    }
    return normalizedMessage;
  }
}