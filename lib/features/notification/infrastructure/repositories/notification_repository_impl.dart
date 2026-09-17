import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import 'package:seedly_app/features/notification/applications/repositories/notification_repository.dart';
import 'package:seedly_app/features/notification/applications/usecases/notification_store_token_params.dart';
import 'package:seedly_app/features/notification/infrastructure/models/request/notification_store_request_model.dart';
import 'package:seedly_app/features/notification/infrastructure/services/remote/notification_remote_service.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl(
    this._notificationRemoteService,
    this._firebaseMessaging,
    this._baseDioErrorHandler,
  );

  final NotificationRemoteService _notificationRemoteService;
  final FirebaseMessaging _firebaseMessaging;
  final BaseDioErrorHandler _baseDioErrorHandler;

  @override
  Future<ResultEntity<bool>> storeToken(
    NotificationStoreTokenParams params,
  ) async {
    try {
      final response = await _notificationRemoteService
          .notificationRegisterToken(
            NotificationStoreRequestModel(token: params.token),
          );
      return ResultEntity.success(data: response.data.isSuccess);
    } on DioException catch (error) {
      return _baseDioErrorHandler.handleDioError(error) ??
          ResultEntity.error(message: error.message);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }

  @override
  Future<ResultEntity<String>> getToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      if (token == null) {
        return ResultEntity.error(message: 'ERR_FCM_TOKEN_UNAVAILABLE');
      }
      return ResultEntity.success(data: token);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }
}
