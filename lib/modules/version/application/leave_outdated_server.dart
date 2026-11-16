// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/normalize_endpoint.dart';
import 'package:thingsboard_app/utils/services/firebase/default_firebase_app.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

/// Leaves the "Server update required" page for the login page.
///
/// A build for one server ([ownServer] set) has no region switch on its login
/// page, so when a QR code moved it to an outdated server it goes back to its
/// own server first; otherwise that server's login page would be the only one
/// left. A build with regions stays: its login page can switch the region.
Future<void> leaveOutdatedServer({
  required VoidCallback reloadLoginInfo,
  String ownServer = ThingsboardAppConstants.thingsBoardApiEndpoint,
}) async {
  final clientService = getIt<ITbClientService>();
  final endpoints = getIt<IEndpointService>();
  if (ownServer.isNotEmpty &&
      normalizeEndpoint(await endpoints.getEndpoint()) !=
          normalizeEndpoint(ownServer)) {
    try {
      await endpoints.setEndpoint(ownServer);
      await getIt<IFirebaseService>().clearApps();
      if (!await endpoints.isCustomEndpoint()) {
        await initDefaultFirebaseApp();
      }
      await clientService.reInit(
        endpoint: ownServer,
        onDone: reloadLoginInfo,
        onAuthError: (_) {},
      );
    } catch (e, s) {
      // The login page still opens and shows what it can load.
      getIt<TbLogger>().error('Return to own server failed', e, s);
    }
  }
  clientService.clearUnsupportedServer();
}
