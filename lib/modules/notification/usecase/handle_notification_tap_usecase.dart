// ignore_for_file: unused_import

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/usecase/handle_notification_tap_params.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/notification_service.dart';
import 'package:thingsboard_app/utils/usecase.dart';

class HandleNotificationTapUsecase extends UseCase<void, HandleNotificationTapParams> {
  @override
  void call(HandleNotificationTapParams params) {
    final data = params.notification.additionalConfig?['onClick']
            as Map<String, dynamic>? ??
        {};
    final stateEntityId = params.notification.info?.stateEntityId;
    data['stateEntityId'] = stateEntityId?.id;
    data['stateEntityType'] = stateEntityId?.entityType.name;
    return NotificationService.handleClickOnNotification(
      data,
     params.tbContext,
      isOnNotificationsScreenAlready: true,
    );
  }
}
