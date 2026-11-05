// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/provisioning/eps_ble/i_wifi_provisioning_service.dart';
import 'package:thingsboard_app/utils/services/provisioning/eps_ble/wifi_provisioning_service.dart';

abstract final class EspBleDi {
  static void init(String scopeName) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<IBleProvisioningService>(
          () => BleProvisioningService(),
        );
      },
    );
  }

  static void dispose(String scopeName) {
    getIt.dropScope(scopeName);
  }
}
