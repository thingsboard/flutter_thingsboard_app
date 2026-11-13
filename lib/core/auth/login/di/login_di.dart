// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/auth/oauth2/app_secret_provider.dart';
import 'package:thingsboard_app/core/auth/oauth2/i_oauth2_client.dart';
import 'package:thingsboard_app/core/auth/oauth2/tb_oauth2_client.dart';
import 'package:thingsboard_app/locator.dart';

abstract final class LoginDi {
  static const scopeName = 'LoginDi';
  static void init() {
    if (getIt.hasScope(scopeName)) {
      return;
    }
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<IOAuth2Client>(
          () => TbOAuth2Client(
            tbLogger: locator(),
            deviceInfoService: locator(),
            appSecretProvider: AppSecretProvider.local(),
          ),
        );
      },
    );
  }

  static void dispose() {
    if (getIt.hasScope(scopeName)) {
      getIt.dropScope(scopeName);
    }
  }
}
