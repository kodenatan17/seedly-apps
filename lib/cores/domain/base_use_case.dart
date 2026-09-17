import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

abstract class UseCaseWithParams<Params, ReturnType> {
  Future<ResultEntity<ReturnType>> call(Params params);
}

abstract class UseCase<ReturnType> {
  Future<ResultEntity<ReturnType>> call();
}