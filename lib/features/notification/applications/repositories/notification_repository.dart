import 'package:growpico_app/cores/domain/base_result_entity_helper.dart';
import 'package:growpico_app/features/notification/applications/usecases/notification_store_token_params.dart';

abstract class NotificationRepository {
  Future<ResultEntity<bool>> storeToken(NotificationStoreTokenParams params);
  Future<ResultEntity<String>> getToken();
}
