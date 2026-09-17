import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seedly_app/cores/constant/base_apis.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/cores/data/remote/response/boolean_only_remote_response.dart';
import 'package:seedly_app/features/notification/infrastructure/models/request/notification_store_request_model.dart';
import 'package:seedly_app/features/notification/infrastructure/services/dio/notification_ret_network_client.dart';

part 'notification_remote_service.g.dart';

@RestApi()
abstract class NotificationRemoteService {
  @factoryMethod
  factory NotificationRemoteService(
    NotificationRetApiDio client, {
    String baseUrl,
  }) = _NotificationRemoteService;

  @POST(BaseApis.notificationRegisterToken)
  Future<BaseSuccessResponse<BooleanOnlyRemoteResponse>>
  notificationRegisterToken(@Body() NotificationStoreRequestModel model);
}
