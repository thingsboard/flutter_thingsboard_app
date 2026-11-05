// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_import

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/notification/application/notification_service.dart';
import 'package:thingsboard_app/modules/notification/domain/usecases/handle_notification_tap_params.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class HandleNotificationTapUsecase
    extends UseCase<void, HandleNotificationTapParams> {
  @override
  void call(HandleNotificationTapParams params) {
    final onClick = params.notification.additionalConfig?.asMap['onClick'];
    final data = <String, dynamic>{
      if (onClick is Map) ...onClick.cast<String, dynamic>(),
    };
    final stateEntityId = params.notification.info?.stateEntityId;
    data['stateEntityId'] = stateEntityId?.id;
    data['stateEntityType'] = stateEntityId?.entityType.name;
    return NotificationService.handleClickOnNotification(
      data,

      isOnNotificationsScreenAlready: true,
    );
  }
}
