// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/normalize_endpoint.dart';
import 'package:thingsboard_app/utils/services/firebase/default_firebase_app.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

/// Saves [endpoint] as the app's server, replaces the Firebase apps with the
/// default one when [endpoint] is the build's own server, and re-creates the
/// client, which restores whatever session is in the storage.
Future<void> pointAppAt(
  String endpoint, {
  required VoidCallback onDone,
  required ErrorCallback onAuthError,
}) async {
  // The client gets the same form the endpoint service stores: a trailing
  // slash would turn image and websocket URLs into `//api/...`.
  final normalized = normalizeEndpoint(endpoint);
  final endpoints = getIt<IEndpointService>();
  await endpoints.setEndpoint(normalized);
  await getIt<IFirebaseService>().clearApps();
  if (!await endpoints.isCustomEndpoint()) {
    await initDefaultFirebaseApp();
  }
  await getIt<ITbClientService>().reInit(
    endpoint: normalized,
    onDone: onDone,
    onAuthError: onAuthError,
  );
}
