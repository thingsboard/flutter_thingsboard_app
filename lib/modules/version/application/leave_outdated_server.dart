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
import 'package:thingsboard_app/utils/services/endpoint/point_app_at.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

/// Leaves the "Server update required" page for the login page.
///
/// A build for one server ([ownServer] set) has no region switch on its login
/// page, so when the app is on another server and that server is the outdated
/// one, it goes back to its own server first. It stays when a rolled back QR
/// code switch already left it on another, supported server, and in a build
/// with regions, whose login page can switch the region.
Future<void> leaveOutdatedServer({
  required VoidCallback reloadLoginInfo,
  String ownServer = ThingsboardAppConstants.thingsBoardApiEndpoint,
}) async {
  final clientService = getIt<ITbClientService>();
  final current = normalizeEndpoint(
    await getIt<IEndpointService>().getEndpoint(),
  );
  final outdated = clientService.unsupportedServerEndpoint;
  final onOutdatedServer =
      outdated == null || normalizeEndpoint(outdated) == current;
  if (ownServer.isNotEmpty &&
      onOutdatedServer &&
      current != normalizeEndpoint(ownServer)) {
    try {
      await pointAppAt(ownServer, onDone: reloadLoginInfo, onAuthError: (_) {});
    } catch (e, s) {
      // The login page still opens and shows what it can load.
      getIt<TbLogger>().error('Return to own server failed', e, s);
    }
  }
  clientService.clearUnsupportedServer();
}
