import 'package:equatable/equatable.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';

mixin ResultEntity<T> {
  void when({
    Function(ResultSuccess<T>)? success,
    Function(ResultError<T>)? error,
  });

  static ResultSuccess<T> success<T>({required T data, Meta? meta}) {
    return ResultSuccess(data: data, meta: meta);
  }

  static ResultError<T> error<T>({required message}) {
    return ResultError(code: 1, message: message);
  }
}

class ResultSuccess<T> extends Equatable with ResultEntity<T> {
  final T data;
  final Meta? meta;

  ResultSuccess({required this.data, this.meta});

  @override
  void when({
    Function(ResultSuccess<T>)? success,
    Function(ResultError<T>)? error,
  }) {
    if (success != null) success(this);
  }

  @override
  List<Object?> get props => [data, meta];
}

class ResultError<T> extends Equatable with ResultEntity<T> {
  final int code;
  final String message;

  ResultError({
    required this.code,
    required this.message,
  });

  @override
  void when({
    Function(ResultSuccess<T>)? success,
    Function(ResultError<T>)? error,
  }) {
    if (error != null) error(this);
  }

  @override
  List<Object?> get props => [code, message];
}

extension ResultX<T> on ResultEntity<T> {
  T? get successOrNull {
    if (this is ResultSuccess<T>) {
      return (this as ResultSuccess<T>).data;
    }
    return null;
  }
}
