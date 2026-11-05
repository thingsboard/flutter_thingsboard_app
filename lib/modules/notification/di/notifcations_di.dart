// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/notification/domain/usecases/handle_notification_tap_usecase.dart';

abstract final class NotifcationsDi {
  static const _scopeName = 'NotifcationsDi';
  static void init() {
    if (getIt.hasScope(_scopeName)) {
      return;
    }
    getIt.pushNewScope(
      scopeName: _scopeName,
      init:
          (getIt) =>
              getIt.registerFactory(() => HandleNotificationTapUsecase()),
    );
  }

  static void dispose() {
    getIt.dropScope(_scopeName);
  }
}
