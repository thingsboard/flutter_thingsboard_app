// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Camera, microphone and similar only for pages of the server at [endpoint].
/// An `http` endpoint on the default port also covers its host over `https`,
/// for servers that redirect to HTTPS.
PermissionResponse endpointOnlyPermission(
  PermissionRequest request,
  String endpoint,
) {
  final server = Uri.tryParse(endpoint);
  final origin = request.origin;
  final sameServer =
      server != null &&
      origin.host == server.host &&
      ((origin.scheme == server.scheme && origin.port == server.port) ||
          _isHttpsUpgrade(server, origin));
  return PermissionResponse(
    resources: request.resources,
    action: sameServer
        ? PermissionResponseAction.GRANT
        : PermissionResponseAction.DENY,
  );
}

bool _isHttpsUpgrade(Uri server, Uri origin) =>
    server.scheme == 'http' &&
    server.port == 80 &&
    origin.scheme == 'https' &&
    origin.port == 443;
