import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/domain/base_use_case.dart';
import 'package:seedly_app/features/notification/applications/repositories/notification_repository.dart';
import 'package:seedly_app/features/notification/applications/usecases/notification_store_token_params.dart';

@injectable
class NotificationStoreTokenUseCase
    extends UseCaseWithParams<NotificationStoreTokenParams, void> {
  NotificationStoreTokenUseCase(this._notificationRepository);
  final NotificationRepository _notificationRepository;

  @override
  Future<ResultEntity<void>> call(NotificationStoreTokenParams params) async {
    return _notificationRepository.storeToken(params);
  }
}
