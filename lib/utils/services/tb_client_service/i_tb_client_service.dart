// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class ITbClientService {
  Future<void> init();
  ThingsboardClient get client;
  Future<void> reInit({
    required String endpoint,
    required VoidCallback onDone,
    required ErrorCallback onAuthError,
  });

  /// The server is older than the client supports; the router shows the
  /// server update page while this is set.
  ValueListenable<UnsupportedServerVersionError?> get unsupportedServer;

  /// The endpoint [unsupportedServer] was reached at, when the reporter knew
  /// it. A QR code switch to an outdated server is rolled back, so by the
  /// time the server update page shows, the app's endpoint is the previous
  /// server again and no longer names the outdated one.
  String? get unsupportedServerEndpoint;

  /// Records [error] when it is an [UnsupportedServerVersionError]: the
  /// caller's flow ends there, the server update page explains it. Returns
  /// whether it was one. [endpoint] is the server that answered, for a caller
  /// that talks to another server than the app's current one.
  bool reportUnsupportedServer(Object error, {String? endpoint});

  /// Leaves the server update page (back to the login page).
  void clearUnsupportedServer();
}
